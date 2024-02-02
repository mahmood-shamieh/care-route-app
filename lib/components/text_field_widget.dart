import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? icon;
  final bool? isPasswordField;
  bool showPassword = true;
  TextFieldWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.icon,
      this.isPasswordField});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        // controller: widget.controller,
        style: MyTheme.getTextStyle1(
          color: MyTheme.darkGreyColor,
        ),
        obscureText:
            widget.isPasswordField ?? false ? widget.showPassword : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12, left: 15, right: 15),
          hintText: widget.hintText,
          hintStyle: MyTheme.getTextStyle1(
            color: MyTheme.darkGreyColor,
          ),
          filled: true,
          fillColor: MyTheme.greyColor,
          suffixIcon: widget.isPasswordField ?? false
              ? InkWell(
                  onTap: () => setState(() {
                    widget.showPassword = !widget.showPassword;
                  }),
                  child: Icon(
                    widget.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: MyTheme.darkGreyColor,
                  ),
                )
              : widget.icon,
          border: OutlineInputBorder(
            borderRadius: MyTheme.buttonsRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: MyTheme.buttonsRadius,
            borderSide: BorderSide(color: MyTheme.borderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
