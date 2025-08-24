import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/view/widget/custome_text/custome_text.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Color bgColor;
  final Color borderColor;
  final String icon;
  final String text;
  const MyButton({
    super.key,
     this.icon = "",
    required this.text,
    required this.bgColor,
    required this.borderColor,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 4,),
            CustomeText(text: text,fontWeight: FontWeight.w500,)
          ],
        ),
      ),
    );
  }
}
