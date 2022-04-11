import 'package:flutter/material.dart';

import 'AppColors.dart';

class CustomInputDecoration{


  static InputDecoration inputDecoration({required labelText, String hintText = "", IconData? icon, double radius = 10}) => InputDecoration(
      labelStyle: TextStyle(
        color: Colors.black45,
        backgroundColor: AppColors.COLOR_GREY,
      ),
      contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      hintText: '$hintText',
      labelText: '$labelText',
      hintStyle: TextStyle(color: Colors.black45),
      fillColor: AppColors.COLOR_GREY,
      filled: true,
      border: borderColor(radius: radius),
      focusedBorder: borderColor(radius: radius),
      disabledBorder: borderColorDisable(radius: radius),
      enabledBorder: borderColorDisable(radius: radius),
      suffixIcon: icon == null ? SizedBox() : Icon(icon)
  );

  static InputDecoration selectDecoration({required labelText, String hintText = "กรุณาเลือก", double radius = 10}) => InputDecoration(
    labelStyle: TextStyle(
      color: Colors.black45,
      backgroundColor: AppColors.COLOR_GREY,
    ),
    contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    hintText: '$hintText',
    labelText: '$labelText',
    hintStyle: TextStyle(color: Colors.black45),
    fillColor: AppColors.COLOR_GREY,
    filled: true,
    focusedBorder: borderColor(radius : radius),
    enabledBorder: borderColor(radius : radius),
    disabledBorder: borderColorDisable(radius : radius),
    enabled: false,
    suffixIcon: Icon(Icons.expand_more_rounded),
  );



  static OutlineInputBorder borderColor({double radius = 10}) => OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
    borderSide: BorderSide(
      color: AppColors.COLOR_PRIMARY,
      width: 1,
    ),
  );

  static OutlineInputBorder borderColorDisable({double radius = 10}) => OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
    borderSide: BorderSide(
      color: AppColors.COLOR_GREY,
      width: 1,
    ),
  );
}