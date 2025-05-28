import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class ImageUtil {
  Image assetImageUtil({required String imageName, double? height, double? width, BoxFit? boxFit}) {
    return Image.asset(
      "assets/image/$imageName",
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.contain,
    );
  }

  SvgPicture assetSvgPictureUtil({required String svgName, double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      "assets/svg/$svgName.svg",
      height: height,
      width: width,
      // ignore: deprecated_member_use
      color: color,
      fit: BoxFit.contain,
    );
  }

  LottieBuilder assetLottieUtil({required String lottieName, double? height, double? width, bool? repeat, bool? animate}) {
    return Lottie.asset(
      "assets/lottie/$lottieName.json",
      height: height,
      width: width,
      fit: BoxFit.fitWidth,
      frameRate: const FrameRate(60),
      repeat: repeat,
      animate: animate,
    );
  }
}
