import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medication_reminder_app/core/extension/num_extension.dart';

class CustomTextFormField extends TextField {
  CustomTextFormField({
    Key? key,
    String? hint,
    String? errorText,
    TextEditingController? controller,
    Icon? icon,
    TextStyle? textStyle,
    TextStyle? hintStyle,
  }) : super(
            key: key,
            autofocus: false,
            controller: controller,
            textInputAction: TextInputAction.next,
            style: textStyle,
            cursorHeight: 30.h,
            scrollPadding: const EdgeInsets.all(10),
            decoration: InputDecoration(
              errorText: errorText,
              hintStyle: hintStyle,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 0.8.w)),
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
  }) : super(key: key);
  final String title;
  final String? hint;

  final TextEditingController? controller;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title.tr(),
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black54)),
        CustomTextFormField(
          controller: controller,
          textStyle: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w600),
          icon: Icon(
            icon,
            size: 30,
          ),
          hint: hint,
          hintStyle: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
