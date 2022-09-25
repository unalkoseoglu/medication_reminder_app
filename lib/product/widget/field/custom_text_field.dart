import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/context_extension.dart';

import '../../init/theme/app_theme_light.dart';

class CustomTextFormField extends TextField {
  CustomTextFormField(
      {Key? key,
      required BuildContext context,
      String? hint,
      String? errorText,
      TextEditingController? controller,
      Icon? icon,
      TextStyle? textStyle,
      TextStyle? hintStyle,
      TextInputType? keyboardType})
      : super(
            key: key,
            autofocus: false,
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            style: textStyle,
            cursorHeight: context.height(0.02),
            scrollPadding: const EdgeInsets.all(10),
            decoration: InputDecoration(
              errorText: errorText,
              hintStyle: hintStyle,
              suffixIcon: icon,
              hintText: hint,
            ));
}

class ITextField extends StatelessWidget {
  const ITextField({
    Key? key,
    required this.title,
    this.controller,
    this.icon,
    this.hint,
    this.keyboardType,
  }) : super(key: key);
  final String title;
  final String? hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title.tr(),
            style: context.textTheme.labelLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black54)),
        CustomTextFormField(
          context: context,
          controller: controller,
          keyboardType: keyboardType,
          textStyle: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.w600),
          icon: Icon(
            icon,
            size: 26,
            color: AppThemeLight.instance.colorSchemeLight?.ultraRed,
          ),
          hint: hint,
          hintStyle: context.textTheme.subtitle2,
        ),
      ],
    );
  }
}
