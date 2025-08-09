import 'package:earn_watching_ads/core/widgets/app_button.dart';
import 'package:earn_watching_ads/core/widgets/app_text_field.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart'
    show AuthPageTitle;
import 'package:earn_watching_ads/features/profileOnboard/bloc/onboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileOnboard extends StatefulWidget {
  const ProfileOnboard({super.key});

  @override
  State<ProfileOnboard> createState() => _ProfileOnboardState();
}

class _ProfileOnboardState extends State<ProfileOnboard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController numController = TextEditingController();

  final List<String> genders = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardBloc, OnboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(48.h),
                AppLogo(),
                AuthPageTitle(title: title(state.step) ?? ""),
                Gap(28.h),

                // Show correct input per step
                if (state.step == 2)
                  DropdownButtonFormField(
                    value: useController(2)!.text.isEmpty
                        ? null
                        : useController(2)!.text,
                    items: genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      useController(2)!.text = value ?? "";
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Select Gender",
                    ),
                  )
                else
                  AppTextField(
                    labelText: label(state.step),
                    textEditingController: useController(state.step),
                  ),
                Gap(28.h),
                AppButton(
                  buttonName: (state.step < 3) ? "Next" : "Submit",
                  ontap: () {
                    if (state.step < 3) {
                      if (state.step == 2 && genderController.text.isEmpty) {
                        print("Please select your Gender");
                      } else if (useController(state.step)!.text.isEmpty) {
                        print("Please fill out the form");
                      } else {
                        context.read<OnboardBloc>().add(NextStepEvent());
                      }
                    } else {
                      // Submit profile data
                      print("Name: ${nameController.text}");
                      print("Age: ${ageController.text}");
                      print("Gender: ${genderController.text}");
                      print("Number: ${numController.text}");
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Reuse your helper methods with step from bloc state
  TextEditingController? useController(int step) {
    switch (step) {
      case 0:
        return nameController;
      case 1:
        return ageController;
      case 2:
        return genderController;
      case 3:
        return numController;
    }
    return null;
  }

  String? title(int step) {
    switch (step) {
      case 0:
        return "Enter Your Full Name";
      case 1:
        return "Enter Your Age";
      case 2:
        return "Select Your Gender";
      case 3:
        return "Enter Your Number";
    }
    return null;
  }

  String? label(int step) {
    switch (step) {
      case 0:
        return "Full Name";
      case 1:
        return "Age";
      case 3:
        return "Mobile Number +880";
    }
    return null;
  }
}
