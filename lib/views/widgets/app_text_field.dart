import 'package:flutter/material.dart';
import 'package:pharmacy/constants/colors.dart';

class AppTextField extends StatelessWidget {
  final double height;
  final double? width;
  final String hint;
  final bool withLabel;
  final double fontSize;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final Color borderColor;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.height = 0,
    this.width,
    this.hint = '',
    this.withLabel = false,
    this.fontSize = 16,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.enabled = true,
    this.borderColor = AppColors.blue,
    this.onTapOutside,
    this.onChanged,
    this.keyboardType,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onTapOutside: onTapOutside,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        cursorColor: AppColors.blue,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        textAlign: textAlign,
        style: TextStyle(
          color: AppColors.blue,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: withLabel ? '' : hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          label: withLabel
              ? Text(
                  hint,
                  style: TextStyle(color: Colors.grey.shade400),
                )
              : null,
          suffixIcon: suffixIcon,
          suffixIconColor: const Color(0xFF767676),
          contentPadding: EdgeInsets.symmetric(
            vertical: height,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusColor: const Color(0xFF767676),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
