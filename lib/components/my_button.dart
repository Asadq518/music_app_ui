import 'package:flutter/material.dart';
import 'package:music_app/components/style.dart';

import 'colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.primary,
        boxShadow: myWhiteAndBlackOuterShaddow,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.btn,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: MyColors.white.withOpacity(.05),
              offset: const Offset(2, 1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
            BoxShadow(
              color: MyColors.black.withOpacity(.2),
              offset: const Offset(-2, -1),
              spreadRadius: 0,
              blurRadius: 2,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.6],
            colors: [
              MyColors.btnGradentlight,
              MyColors.btnGradentDark,
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            icon,
            color: MyColors.secondary,
          ),
        ),
      ),
    );
  }
}
