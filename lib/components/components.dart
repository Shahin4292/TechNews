import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: AppColors.lightWhite,
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageUrl, title;

  const BottomSheetImage(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 10,
          child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              child: BoldText(text: title, size: 18, color: Colors.white)),
        )
      ]),
    );
  }
}
