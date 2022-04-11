import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'Constants.dart';

Widget loading() {
  return Container(
    color: Colors.white,
    child: Center(
      child: Platform.isIOS ? CupertinoActivityIndicator() : CircularProgressIndicator(color: AppColors.COLOR_PRIMARY),
    ),
  );
}
