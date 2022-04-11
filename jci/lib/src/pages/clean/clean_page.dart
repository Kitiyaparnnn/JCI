import 'package:flutter/material.dart';
import 'package:jci/src/models/MapModel.dart';
import 'package:jci/src/utils/AppColors.dart';

import '../../utils/Constants.dart';

class CleanPage extends StatefulWidget {
  CleanPage({Key? key}) : super(key: key);

  @override
  State<CleanPage> createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            '${Constants.CLEAN_TITLE}',
            style: TextStyle(fontSize: 16, color: AppColors.COLOR_DARK),
          ),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: AppColors.COLOR_DARK)),
          backgroundColor: AppColors.COLOR_WHITE,
          elevation: 0,
        ),
        body: GestureDetector(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  SizedBox(
                    height: constraints.biggest.height,
                    child: Image.asset(
                      "${Constants.IMAGE_DIR}/bg_clean.jpg",
                    ),
                  ),
                  Positioned(
                    top: .58 * constraints.biggest.height,
                    left: .92 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.CLEAN_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .20 * constraints.biggest.height,
                    left: .95 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.CLEAN_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .32 * constraints.biggest.height,
                    right: .99 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.CLEAN_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .40 * constraints.biggest.height,
                    right: .58 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.CLEAN_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
