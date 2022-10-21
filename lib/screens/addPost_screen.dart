import 'package:flutter/material.dart';
import 'package:project10/utils/MultipleImagePicker.dart';
import 'package:project10/widgets/addPostContainers.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

/// add this line just after scaffold
///extendbodybehindappbar true
///background color.transparent
///elevation 0
///
class _AddPostScreenState extends State<AddPostScreen> {
  //TODO
  void onTapRoute() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultipleImagePicker(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor == Brightness.light
            ? Colors.transparent
            : Colors.black38,
        elevation: 0,
        title: const Text("Choose Post Category..."),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (2 / 1.2),
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
            ),
            children: [
              AddPostContainers(
                nameCategory: "new vehicles",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 90, 9, 9),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Used Vehicle sale",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 8, 9, 41),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Vehicle Remake Services",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor:
                    const Color.fromARGB(255, 55, 25, 185),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Spare parts",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 63, 27, 27),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Insurance plans",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 10, 57, 83),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Garage",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor:
                    const Color.fromARGB(255, 247, 69, 69),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Mobile Mechanic",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 82, 76, 3),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Vehicle Recovery sevices",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 31, 23, 70),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Transport & delivery",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 34, 61, 61),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Insurance",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 56, 71, 61),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Travel & Booking",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 33, 24, 66),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "Houses",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 33, 24, 66),
                iconName: Icons.book,
              ),
              AddPostContainers(
                nameCategory: "lands",
                onTapRoute: onTapRoute,
                iconColorName: Colors.white,
                containerBackgroundColor: const Color.fromARGB(255, 33, 24, 66),
                iconName: Icons.book,
              ),
            ],
          ),
          //  Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.white,
          //           //color: Color.fromARGB(255, 90, 9, 9),
          //         ),
          //         child: Row(
          //           children: [const Text("your category not available?")],
          //         ),
          //       )
        ),
      ),
    );
  }
}
