import 'package:flutter/material.dart';
import 'package:jci/src/models/MapModel.dart';
import 'package:jci/src/utils/AppColors.dart';

import '../../utils/Constants.dart';

class DirtyPage extends StatefulWidget {
  DirtyPage({Key? key}) : super(key: key);

  @override
  State<DirtyPage> createState() => _DirtyPageState();
}

class _DirtyPageState extends State<DirtyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            '${Constants.DIRTY_TITLE}',
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
                      "${Constants.IMAGE_DIR}/bg_dirty.jpg",
                    ),
                  ),
                  Positioned(
                    top: .70 * constraints.biggest.height,
                    left: .50 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.DIRTY_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .03 * constraints.biggest.height,
                    right: .95 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.DIRTY_TEXT_POINT2,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .22 * constraints.biggest.height,
                    right: .42 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.DIRTY_TEXT_POINT3,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .25 * constraints.biggest.height,
                    right: .34 * constraints.biggest.width,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.DIRTY_TEXT_POINT4,
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
