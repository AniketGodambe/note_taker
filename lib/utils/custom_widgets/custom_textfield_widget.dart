import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_const.dart';
import 'custom_text_style.dart';
import 'gaps.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final bool? readOnly;
  final bool isEnabled;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool autofocus;
  final bool isViewButtonRequired;
  final int? maxLength;
  final int? maxLines;
  final bool isCounttextRequired;
  final bool validationTextRequired;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomInputField({
    super.key,
    this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.initialValue,
    required this.title,
    required this.textInputType,
    this.readOnly = false,
    this.isEnabled = true,
    this.hintText = '',
    this.validator,
    this.controller,
    this.obscureText = false,
    this.isViewButtonRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.isCounttextRequired = false,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.validationTextRequired = true,
  });

  List<TextInputFormatter>? getInputFormatters(TextInputType inputType) {
    if (inputType == TextInputType.number) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      ];
    } else if (inputType == TextInputType.name) {
      return <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ""
            ? const SizedBox()
            : Text(
                title,
                style: titleTextStyle,
              ),
        title == "" ? const SizedBox() : Gaps.kheight5,
        TextFormField(
          focusNode: focusNode,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: controller,
          obscureText: obscureText,
          cursorColor: secondaryColor,
          inputFormatters: getInputFormatters(textInputType),
          initialValue: initialValue,
          keyboardType: textInputType,
          readOnly: readOnly ?? false,
          enabled: isEnabled,
          onFieldSubmitted: onSubmit,
          onChanged: onChanged,
          autofocus: autofocus,
          validator: validator ??
              (!validationTextRequired
                  ? null
                  : (val) {
                      if (val!.isEmpty) {
                        return getValidatorText("$title required");
                      }
                      return null;
                    }),
          style: const TextStyle(
            color: Color(0xff4E4D4D),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            counterText: isCounttextRequired ? null : "",
            errorMaxLines: 1,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 12, top: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class CustomBioInputField extends StatelessWidget {
  final String title;
  final String? initialValue, errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final bool? readOnly;
  final bool isEnabled;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final bool obscureText;
  final bool autofocus;
  final bool isViewButtonRequired;
  final int? maxLength;
  final int? maxLines;
  final bool isCounttextRequired;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomBioInputField({
    super.key,
    this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.initialValue,
    this.errorText,
    required this.title,
    required this.textInputType,
    this.readOnly = false,
    this.isEnabled = true,
    this.hintText = '',
    this.validator,
    this.textController,
    this.obscureText = false,
    this.isViewButtonRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.isCounttextRequired = false,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
  });

  // List<TextInputFormatter>? getInputFormatters(TextInputType inputType) {
  //   if (inputType == TextInputType.number) {
  //     return <TextInputFormatter>[
  //       FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
  //     ];
  //   } else if (inputType == TextInputType.name) {
  //     return <TextInputFormatter>[
  //       FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
  //     ];
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ""
            ? const SizedBox()
            : Text(
                title,
                style: titleTextStyle,
              ),
        title == "" ? const SizedBox() : Gaps.kheight5,
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            focusNode: focusNode,
            maxLines: maxLines,
            maxLength: maxLength,
            controller: textController,
            obscureText: obscureText,
            cursorColor: secondaryColor,
            // inputFormatters: getInputFormatters(textInputType),
            initialValue: initialValue,
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            enabled: isEnabled,
            onFieldSubmitted: onSubmit,
            onChanged: onChanged,
            autofocus: autofocus,
            validator: validator ??
                (val) {
                  // if (val!.isEmpty) {
                  //   return getValidatorText("$title required");
                  // }
                  return null;
                },
            style: const TextStyle(
              color: Color(0xff4E4D4D),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              counterText: isCounttextRequired ? null : "",
              errorMaxLines: 2,
              hintText: hintText,
              hintMaxLines: 5,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(
                  left: 12, right: 12, top: 8.0, bottom: 8.0),
              /* enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(6)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(6),
              ), */
              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Text(
              errorText ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ),
      ],
    );
  }
}

getValidatorText(String value) {
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
