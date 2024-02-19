import 'package:agronews/screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ServicesCard extends StatelessWidget {
  final List<ImageModel> images;

  ServicesCard({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: images.map((image) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GestureDetector(
            onTap: () {
              Get.to(Webview(
                url: image.imageUrl,
              ));
            },
            child: Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircleAvatar(
                      foregroundImage:
                          DecorationImage(image: image.image, fit: BoxFit.cover)
                              .image,
                      radius: 28,
                      // child:Container(decoration: , ),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Text(
                  image.title,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Modèle d'image
class ImageModel {
  final String title;
  final ImageProvider image;
  final String imageUrl;

  ImageModel(
      {required this.title, required this.image, required this.imageUrl});
}
