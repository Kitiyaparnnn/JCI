import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/models/MapModel.dart';
import 'package:jci/src/pages/sterile/sterileDetail_page.dart';
import 'package:jci/src/utils/AppColors.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/Constants.dart';
import '../../utils/CustomShowcase.dart';

class SterilePage extends StatefulWidget {
  SterilePage({Key? key}) : super(key: key);

  @override
  State<SterilePage> createState() => _SterilePageState();
}

class _SterilePageState extends State<SterilePage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _flour = GlobalKey();

  int imgWidth = 0;
  int imgHeight = 0;
  bool isWait = true;

  imageSize() async {
    var img = await rootBundle.load("${Constants.IMAGE_DIR}/bg_sterile.jpg");
    var decodedImage = await decodeImageFromList(img.buffer.asUint8List());

    setState(() {
      imgWidth = decodedImage.width;
      imgHeight = decodedImage.height;
      isWait = false;
    });
    // print(imgHeight);
    // print(imgWidth);
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
                '${Constants.STERILE_TITLE}',
                style: TextStyle(fontSize: 18, color: AppColors.COLOR_DARK),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: AppColors.COLOR_DARK)),
              backgroundColor: AppColors.COLOR_WHITE,
              elevation: 0,
            ),
            body: SafeArea(
              child: GestureDetector(
                child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: isWait
                        ? SizedBox(
                            height: constraints.biggest.height,
                            child: Image.asset(
                              "${Constants.IMAGE_DIR}/bg_sterile.jpg",
                            ),
                          )
                        : Stack(
                            children: [
                              SizedBox(
                                height: constraints.biggest.height,
                                child: Image.asset(
                                  "${Constants.IMAGE_DIR}/bg_sterile.jpg",
                                ),
                              ),
                              Positioned(
                                top: .19 * imgHeight,
                                left: .095 * imgWidth,
                                child: InkWell(
                                  onTap: () => ShowCaseWidget.of(context)
                                      ?.startShowCase([_one]),
                                  child: CustomShowcaseWidget(
                                      globalKey: _one,
                                      description:
                                          Constants.STERILE_TEXT_POINT1,
                                      page: SterileDetailPage()),
                                ),
                              ),
                              Positioned(
                                top: .28 * imgHeight,
                                left: .16 * imgWidth,
                                child: InkWell(
                                  onTap: () => ShowCaseWidget.of(context)
                                      ?.startShowCase([_two]),
                                  child: CustomShowcaseWidget(
                                      globalKey: _two,
                                      description:
                                          Constants.STERILE_TEXT_POINT2,
                                      page: SterileDetailPage()),
                                ),
                              ),
                              Positioned(
                                top: .26 * imgHeight,
                                left: .25 * imgWidth,
                                child: InkWell(
                                  onTap: () => ShowCaseWidget.of(context)
                                      ?.startShowCase([_three]),
                                  child: CustomShowcaseWidget(
                                      globalKey: _three,
                                      description:
                                          Constants.STERILE_TEXT_POINT3,
                                      page: SterileDetailPage()),
                                ),
                              ),
                              Positioned(
                                top: .28 * imgHeight,
                                left: .335 * imgWidth,
                                child: InkWell(
                                  onTap: () => ShowCaseWidget.of(context)
                                      ?.startShowCase([_flour]),
                                  child: CustomShowcaseWidget(
                                      globalKey: _flour,
                                      description:
                                          Constants.STERILE_TEXT_POINT4,
                                      page: SterileDetailPage()),
                                ),
                              )
                            ],
                          ),
                  );
                }),
              ),
            )),
      ),
    );
  }
}
