import 'package:flutter/material.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/utils/text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({Key? key, required this.onCategorySelected})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  final Function(String) onCategorySelected;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Remove the actions or replace with another widget
      actions: const [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Discover', size: 20, color: AppColors.primary),
            ModifiedText(text: 'News', size: 20, color: AppColors.lightwhite)
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
