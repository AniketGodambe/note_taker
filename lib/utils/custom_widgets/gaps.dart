import 'package:flutter/material.dart';

import 'colors_const.dart';

class Gaps {
  // Height  SizedBoxants
  static const SizedBox kheight5 = SizedBox(height: 5);
  static const SizedBox kheight10 = SizedBox(height: 10);
  static const SizedBox kheight15 = SizedBox(height: 15);
  static const SizedBox kheight16 = SizedBox(height: 16);
  static const SizedBox kheight20 = SizedBox(height: 20);
  static const SizedBox kheight25 = SizedBox(height: 25);
  static const SizedBox kheight30 = SizedBox(height: 30);
  static const SizedBox kheight40 = SizedBox(height: 40);
  static const SizedBox kheight50 = SizedBox(height: 50);
  static const SizedBox kheight60 = SizedBox(height: 60);
  static const SizedBox kheight80 = SizedBox(height: 80);

// Width  SizedBoxants
  static const SizedBox kwidth2 = SizedBox(width: 2);
  static const SizedBox kwidth5 = SizedBox(width: 5);
  static const SizedBox kwidth10 = SizedBox(width: 10);
  static const SizedBox kwidth15 = SizedBox(width: 15);
  static const SizedBox kwidth16 = SizedBox(width: 16);
  static const SizedBox kwidth20 = SizedBox(width: 20);
  static const SizedBox kwidth25 = SizedBox(width: 25);
  static const SizedBox kwidth30 = SizedBox(width: 30);
  static const SizedBox kwidth40 = SizedBox(width: 40);
  static const SizedBox sizedBox = SizedBox();
}

class GetDivider20 extends StatelessWidget {
  final Color? color;
  final bool? isTopBottomSpace;
  const GetDivider20({super.key, this.color, this.isTopBottomSpace});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isTopBottomSpace == false ? const SizedBox() : Gaps.kheight20,
        Divider(thickness: 1, color: color ?? borderColor, height: 1),
        isTopBottomSpace == false ? const SizedBox() : Gaps.kheight20,
      ],
    );
  }
}

class GetDivider10 extends StatelessWidget {
  final Color? color;
  final bool? isTopBottomSpace;
  const GetDivider10({super.key, this.color, this.isTopBottomSpace});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isTopBottomSpace == false ? const SizedBox() : Gaps.kheight10,
        Divider(thickness: 1, color: color ?? borderColor, height: 1),
        isTopBottomSpace == false ? const SizedBox() : Gaps.kheight10,
      ],
    );
  }
}
