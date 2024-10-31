import 'package:flutter/material.dart';
import 'package:note_taker/utils/custom_widgets/colors_const.dart';
import 'package:note_taker/utils/custom_widgets/custom_text_style.dart';

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final String? value, title, hintText, subtitle;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;

  final Function(Object?)? onChanged;
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final double editorHeight;
  final double bottompadding;
  final double bottomdropdownpadding;

  const CustomDropDown(
      {super.key,
      this.items,
      this.value = "",
      this.onChanged,
      this.onSaved,
      this.title = "",
      this.hintText = "",
      this.subtitle,
      this.selectedItemBuilder,
      this.prefixIcon,
      this.editorHeight = 0,
      this.bottompadding = 8.0,
      this.bottomdropdownpadding = 4.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title!.isNotEmpty)
          Text(
            title!,
            style: titleTextStyle,
          ),
        if (title!.isNotEmpty) const SizedBox(height: 8),
        SizedBox(
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(8),
            elevation: 0,
            dropdownColor: blackColor,
            selectedItemBuilder: selectedItemBuilder,
            isExpanded: true,
            autofocus: false,
            items: items,
            value: value,

            style: TextStyle(
              color: whiteColor.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            onChanged: (newValue) {
              onChanged!(newValue);
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: whiteColor,
              ),
            ),
            // iconSize: 40,
            validator: (value) {
              if (value == null) {
                return getValidatorText("$title required");
              }
              return null;
            },
            decoration: InputDecoration(
              hoverColor: whiteColor,
              prefixIcon: prefixIcon,
              errorMaxLines: 1,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getValidatorText(value) {
    return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }
}
