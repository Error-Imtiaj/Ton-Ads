import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Payout Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConst.scaffoldPadding),
        child: SingleChildScrollView(child: Column()),
      ),
    );
  }
}
