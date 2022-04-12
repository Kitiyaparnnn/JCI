import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'AppColors.dart';

class CustomShowcaseWidget extends StatelessWidget {
  final String description;
  final GlobalKey globalKey;
  final Widget page;

  CustomShowcaseWidget({required this.description, required this.globalKey,required this.page});

  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        description: description,
        overlayOpacity: 0.0,
        showcaseBackgroundColor: Colors.black87,
        shapeBorder: const CircleBorder(),
        disableAnimation: true,
        descTextStyle: TextStyle(color: AppColors.COLOR_WHITE, fontSize: 12),
        disposeOnTap: true,
        child: Icon(
          Icons.radio_button_checked_outlined,
          color: Colors.red,
        ),
        onTargetClick: () {},
        onToolTipClick: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            )),
      );
}
