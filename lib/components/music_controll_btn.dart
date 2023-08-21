import 'package:flutter/material.dart';
import 'package:music_app/components/style.dart';

import 'colors.dart';

class MusicControlButton extends StatelessWidget {
  const MusicControlButton({
    super.key,
    required this.icons,
    this.isPlay = false,
  });
  final IconData icons;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPlay ? MyColors.red : MyColors.btnGradentDark,
        boxShadow: myWhiteAndBlackOuterShaddow,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isPlay ? MyColors.red : null,
          gradient: isPlay
              ? null
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.2, 0.9],
                  colors: [
                    MyColors.btnGradentlight,
                    MyColors.btnGradentDark.withOpacity(0.5),
                  ],
                ),
          boxShadow: [
            const BoxShadow(
              color: Colors.white10,
            ),
            BoxShadow(
              color: MyColors.btnGradentlight,
              spreadRadius: -12.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        child: Icon(
          icons,
          color: isPlay ? MyColors.white : MyColors.secondary,
        ),
      ),
    );
  }
}
