import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/models/MapModel.dart';
import 'package:jci/src/utils/AppColors.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/Constants.dart';
import '../../utils/CustomShowcase.dart';
import 'cleanDetail_page.dart';

class CleanPage extends StatefulWidget {
  CleanPage({Key? key}) : super(key: key);

  @override
  State<CleanPage> createState() => _CleanPageState();
}

class _CleanPageState extends State<CleanPage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _flour = GlobalKey();

  int imgWidth = 0;
  int imgHeight = 0;
  bool isWait = true;

  imageSize() async {
    var img = await rootBundle.load("${Constants.IMAGE_DIR}/bg_clean.jpg");
    var decodedImage = await decodeImageFromList(img.buffer.asUint8List());

    setState(() {
      imgWidth = decodedImage.width;
      imgHeight = decodedImage.height;
      isWait = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    imageSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              '${Constants.CLEAN_TITLE}',
              style: TextStyle(fontSize: 18, color: AppColors.COLOR_DARK),
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
                      top: .285 * imgHeight,
                      left: .135 * imgWidth,
                      child: InkWell(
                        onTap: () =>
                            ShowCaseWidget.of(context)?.startShowCase([_one]),
                        child: CustomShowcaseWidget(
                            globalKey: _one,
                            description: Constants.CLEAN_TEXT_POINT1,
                            page: CleanDetailPage()),
                      ),
                    ),
                    Positioned(
                      top: .135 * imgHeight,
                      left: .225 * imgWidth,
                      child: InkWell(
                        onTap: () =>
                            ShowCaseWidget.of(context)?.startShowCase([_two]),
                        child: CustomShowcaseWidget(
                            globalKey: _two,
                            description: Constants.CLEAN_TEXT_POINT2,
                            page: CleanDetailPage()),
                      ),
                    ),
                    Positioned(
                      top: .065 * imgHeight,
                      left: .265 * imgWidth,
                      child: InkWell(
                        onTap: () =>
                            ShowCaseWidget.of(context)?.startShowCase([_three]),
                        child: CustomShowcaseWidget(
                            globalKey: _three,
                            description: Constants.CLEAN_TEXT_POINT3,
                            page: CleanDetailPage()),
                      ),
                    ),
                    Positioned(
                      top: .195 * imgHeight,
                      left: .39 * imgWidth,
                      child: InkWell(
                        onTap: () =>
                            ShowCaseWidget.of(context)?.startShowCase([_flour]),
                        child: CustomShowcaseWidget(
                            globalKey: _flour,
                            description: Constants.CLEAN_TEXT_POINT4,
                            page: CleanDetailPage()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
