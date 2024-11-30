import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key}) : preferredSize = const Size.fromHeight(50.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText(text: 'Tech', size: 20, color: AppColors.primary),
              ModifiedText(text: 'News', size: 20, color: AppColors.lightWhite)
            ],
          )),
      centerTitle: true,
    );
  }
}
