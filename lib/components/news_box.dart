import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_newz/utils/colors.dart';

class NewsBox extends StatelessWidget {
  final String imageUrl, title, time, description, url;

  const NewsBox(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          width: size.width,
          color: AppColors.black,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(
                  color: AppColors.primary,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
