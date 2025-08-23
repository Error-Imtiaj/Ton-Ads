import 'package:earn_watching_ads/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppbarWidget(title: "Account Setting"));
  }
}
