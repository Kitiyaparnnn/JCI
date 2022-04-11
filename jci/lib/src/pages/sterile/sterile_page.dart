import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/models/MapModel.dart';
import 'package:jci/src/utils/AppColors.dart';

import '../../utils/Constants.dart';

class SterilePage extends StatefulWidget {
  SterilePage({Key? key}) : super(key: key);

  @override
  State<SterilePage> createState() => _SterilePageState();
}

class _SterilePageState extends State<SterilePage> {
  List<MapModel> mapList = [];
  generateMap() {
    mapList.clear();
    var _map = <MapModel>[
      MapModel(
        top: 0.39,
        left: 0.51,
        right: 0,
        title: Constants.STERILE_TEXT_POINT1,
      ),
      MapModel(
        top: 0.58,
        left: 0.90,
        right: 0,
        title: Constants.STERILE_TEXT_POINT2,
      ),
      MapModel(
        top: 0.45,
        left: 0.99,
        right: 0,
        title: Constants.STERILE_TEXT_POINT3,
      ),
      MapModel(
        top: 0.56,
        left: 0,
        right: 0.75,
        title: Constants.STERILE_TEXT_POINT4,
      ),
    ];
    _map.map((map) {
      mapList.add(map);
    }).toList();
  }

  late int imgWidth;
  late int imgHeight;

  imageSize() async {
    var img = await rootBundle.load("${Constants.IMAGE_DIR}/bg_sterile.jpg");
    var decodedImage = await decodeImageFromList(img.buffer.asUint8List());

    setState(() {
      imgWidth = decodedImage.width;
      imgHeight = decodedImage.height;
    });
    print(imgHeight);
    print(imgWidth);
  }

  @override
  void initState() {
    // TODO: implement initState
    imageSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            '${Constants.STERILE_TITLE}',
            style: TextStyle(fontSize: 16, color: AppColors.COLOR_DARK),
          ),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: AppColors.COLOR_DARK)),
          backgroundColor: AppColors.COLOR_WHITE,
          elevation: 0,
        ),
        body: GestureDetector(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
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
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.STERILE_TEXT_POINT1,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .28 * imgHeight,
                    left: .16 * imgWidth,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.STERILE_TEXT_POINT2,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .26 * imgHeight,
                    left: .25 * imgWidth,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.STERILE_TEXT_POINT3,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: .28 * imgHeight,
                    left: .335 * imgWidth,
                    child: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message: Constants.STERILE_TEXT_POINT4,
                      child: Icon(
                        Icons.radio_button_checked_outlined,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ));
  }

  Positioned point(BoxConstraints constraints, MapModel map) {
    print(map.top);
    return Positioned(
      top: map.top * constraints.biggest.height,
      right: map.right * constraints.biggest.width,
      left: map.left * constraints.biggest.width,
      child: Tooltip(
        triggerMode: TooltipTriggerMode.tap,
        message: map.title,
        child: Icon(
          Icons.radio_button_checked_outlined,
          color: Colors.red,
        ),
      ),
    );
  }
}
