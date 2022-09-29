import 'package:flutter/material.dart';
import 'package:recruit_app/until/const/color.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChange;
  final String? initialValue;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? textInputType;
  final int maxLine;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Color? fillColor;

  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      this.onChange,
      this.initialValue,
      this.isEnabled = true,
      this.validator,
      this.onTap,
      this.textInputType,
      this.maxLine = 1,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.fillColor})
      : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText ?? false,
        maxLines: widget.maxLine,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: color586B8B.withOpacity(0.5), fontSize: 14),
          contentPadding: widget.maxLine == 1
              ? const EdgeInsets.symmetric(vertical: 14, horizontal: 10)
              : null,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          fillColor: widget.isEnabled
              ? widget.fillColor ?? Colors.transparent
              : colorDBDFEF.withOpacity(0.3),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: colorDBDFEF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorDBDFEF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorDBDFEF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorDBDFEF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorDBDFEF),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(value);
          }
        });
  }
}
