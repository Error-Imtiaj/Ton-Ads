import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupIconWidget extends StatelessWidget {
  final String svgAssetPath;
  final Function()? ontap;
  const SignupIconWidget({super.key, required this.svgAssetPath, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SvgPicture.asset(svgAssetPath, width: 44),
    );
  }
}
