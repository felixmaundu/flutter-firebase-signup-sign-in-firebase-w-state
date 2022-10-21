import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPostContainers extends StatelessWidget {
  final String nameCategory;
  //final CallbackAction onTapRoute;
  final Color iconColorName;
  final Color containerBackgroundColor;
  final VoidCallback onTapRoute;
  final IconData iconName;
  final String imageCategory;
  AddPostContainers({
    Key? key,
    required this.nameCategory,
    required this.onTapRoute,
    required this.iconColorName,
    required this.containerBackgroundColor,
    required this.iconName,
    this.imageCategory =
        'https://images.unsplash.com/photo-1542838106-38bae66f985f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c3BvcnRzJTIwY2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  }) : super(key: key);

  final CacheManager cacheManager = CacheManager(
    Config(
      'images_key',
      maxNrOfCacheObjects: 20,
      stalePeriod: Duration(days: 3),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapRoute,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerBackgroundColor,
          //color: Color.fromARGB(255, 90, 9, 9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameCategory,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Icon(
              iconName,
              size: 20,
              color: iconColorName,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageCategory,
                cacheManager: cacheManager,
                key: UniqueKey(),
                width: 30,
                height: 30,
                placeholder: (context, url) => const ColoredBox(
                  color: Colors.black12,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                fadeInCurve: Curves.easeInBack,
                fadeInDuration: Duration(milliseconds: 1500),
                errorWidget: (context, url, error) => const ColoredBox(
                    color: Colors.black12,
                    child: Icon(Icons.error, size: 50, color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
