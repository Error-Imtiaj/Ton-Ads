import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
Widget getStepContent(int currentStep, TextEditingController controller) {
    switch (currentStep) {
      case 0:
        return Column(
          children: [
            const Text("What's your name?"),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter Name"),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            const Text("What's your phone number?"),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter Phone Number"),
              keyboardType: TextInputType.phone,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            const Text("Bkash/Nagad"),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter Email"),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }