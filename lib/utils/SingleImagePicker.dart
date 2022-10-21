import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SingleImagePicker extends StatefulWidget {
  const SingleImagePicker({Key? key}) : super(key: key);

  @override
  State<SingleImagePicker> createState() => _SingleImagePickerState();
}

class _SingleImagePickerState extends State<SingleImagePicker> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        // this._image = imageTemporary;
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  //storing image to phone
  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('v info'),
        ),
        body: Column(
          children: [
            Container(
              child: const Text('V sale'),
            ),
            const SizedBox(
              height: 40,
            ),
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Image.network('https://picsum.photos/250?image=9'),
            //'https://picsum.photos/250?image=9'
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'pick from gallery',
              icon: (Icons.image_outlined),
              onClick: () => getImage(ImageSource.gallery),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'take a photo',
              icon: (Icons.camera),
              onClick: () => getImage(ImageSource.camera),
            )
          ],
        ));
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
      width: 280,
      child: ElevatedButton(
          onPressed: onClick,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 20,
              ),
              Text(title)
            ],
          )));
}
