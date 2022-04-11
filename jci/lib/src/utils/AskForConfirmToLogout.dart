import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jci/src/pages/login/login_page.dart';
import 'package:jci/src/utils/AppColors.dart';
import 'Constants.dart';

void askForConfirmToLogout(BuildContext context) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return CupertinoAlertDialog(
        title: Text(Constants.TEXT_LOGOUT,
            style: TextStyle(color: AppColors.COLOR_RED)),
        content: Text(Constants.TEXT_LOGOUT_MESSAGE,
            style: TextStyle(color: AppColors.COLOR_DARK)),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(Constants.TEXT_LOGOUT,
                style: TextStyle(color: AppColors.COLOR_RED)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              // Navigator.of(dialogContext).pop();
              // BlocProvider.of<AuthenticationBloc>(context).add(AuthEventLoggedOut());
            },
          ),
          CupertinoDialogAction(
            child: Text(
              Constants.TEXT_CANCEL,
              style: TextStyle(color: AppColors.COLOR_DARK),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Dismiss alert dialog
            },
          ),
        ],
      );
    },
  );
}
