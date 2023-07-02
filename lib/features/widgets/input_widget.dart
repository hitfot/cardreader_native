import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  InputWidget({super.key, required this.hintText, this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(59.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 249, 1),
        borderRadius: BorderRadius.circular(32.0),
      ),
      padding: const EdgeInsets.only(
        right: 24.0,
        left: 24.0,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(124, 124, 124, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}