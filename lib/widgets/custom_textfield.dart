import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final double borderRadius;
  final Color cursorColor;
  final Color fillColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool isObscure;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final int? maxLength;
  final bool readOnly;

  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText = '',
      this.hintStyle = const TextStyle(fontSize: 14, color: Colors.grey),
      this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
      this.borderColor = Colors.black,
      this.enabledBorderColor = Colors.transparent,
      this.focusedBorderColor = Colors.transparent,
      this.borderWidth = 1.5,
      this.borderRadius = 10,
      this.cursorColor = Colors.black,
      this.fillColor = Colors.white,
      this.prefixIcon,
      this.suffixIcon,
      this.onSuffixIconPressed,
      this.isObscure = false,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.contentPadding,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlignVertical.center,
      this.maxLength,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlignVertical: textAlignVertical,
      textAlign: textAlign,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      obscureText: isObscure,
      style: textStyle,
      cursorColor: cursorColor,
      inputFormatters: maxLength != null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: onSuffixIconPressed,
              )
            : null,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: enabledBorderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: focusedBorderColor, width: borderWidth + 0.5),
        ),
        counterText: '',
      ),
      maxLength: maxLength,
      onChanged: onChanged,
    );
  }
}
