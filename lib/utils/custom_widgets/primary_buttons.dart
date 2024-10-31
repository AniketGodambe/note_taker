import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'colors_const.dart';
import 'gaps.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isLoading;
  final bool isWhiteColor;
  final Color? textColor;
  final Widget? iconWidget;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isLoading = false,
    this.isWhiteColor = false,
    this.textColor,
    this.iconWidget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: isLoading == true ? () {} : onTap,
      child: Container(
        height: height ?? 50,
        decoration: BoxDecoration(
          color: isWhiteColor ? greyColor : btnColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: isLoading == true
              ? const SizedBox(
                  height: 40,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [whiteColor],
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor ?? backgroundColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    iconWidget == null ? const SizedBox() : Gaps.kwidth10,
                    iconWidget ?? const SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }
}

class PrimaryButton2 extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isLoading;

  const PrimaryButton2({
    super.key,
    required this.onTap,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: isLoading == true
              ? const SizedBox(
                  height: 40,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [btnColor],
                    strokeWidth: 2,
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      color: btnColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class DialogActionFilledButton extends StatelessWidget {
  const DialogActionFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
  });
  final Function() onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor ?? btnColor,
        foregroundColor: foregroundColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 20.0,
        ),
      ),
      child: child,
    );
  }
}
