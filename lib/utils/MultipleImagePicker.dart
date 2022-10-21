import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class MultipleImagePicker extends StatefulWidget {
  const MultipleImagePicker({Key? key}) : super(key: key);

  @override
  State<MultipleImagePicker> createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Images from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    selectImages();
                  }),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: imageFileList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(File(imageFileList![index].path),
                          fit: BoxFit.cover);
                    }),
              ))
            ],
          ),
        ));
  }
}
