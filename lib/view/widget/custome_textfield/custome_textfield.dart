import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors/app_colors.dart';

class CustomeTextfield extends StatefulWidget {
  final TextEditingController? textfielController;
  final String hintText;
  final int? maxLines;
  final bool isPassword;

  const CustomeTextfield({
    super.key,
    required this.hintText,
    required this.textfielController,
    this.maxLines = 1,
    this.isPassword = false,

  });

  @override
  State<CustomeTextfield> createState() => _CustomeTextfieldState();
}

class _CustomeTextfieldState extends State<CustomeTextfield> {
  //obsecure text
  bool obscureText = false;

  //toggle  obsecure
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: AppColors.dropshadow,
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: AppColors.secondaryText),
        controller: widget.textfielController,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: toggle,
                  child: obscureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                )
              : null,
          hintText: widget.hintText,
          filled: true,
          fillColor: AppColors.softBrand,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
