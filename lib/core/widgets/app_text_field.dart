import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/textfield_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final bool? obsecureText;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    super.key,
    required this.labelText,
    this.obsecureText,
    this.textEditingController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 4).r,
      decoration: TextfieldBoxDecoration.textFieldContainerDecoration(
        context: context,
        backgroundColor: AppColors.textFieldBackColor,
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18.r),
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(labelText: labelText),
        controller: textEditingController,
        validator: validator,
      ),
    );
  }
}
