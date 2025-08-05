import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RedirectFromLogin extends StatelessWidget {
  final String? maintext;
  final String? linktext;
  final Function()? ontap;
  const RedirectFromLogin({super.key, this.ontap, this.maintext, this.linktext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: maintext ?? "Don't have an account? ",
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: Colors.black),
          children: [
            TextSpan(
              text: linktext ?? 'Click here',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.appPrimaryColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = ontap,
            ),
          ],
        ),
      ),
    );
  }
}
