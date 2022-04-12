import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/utils/CustomDetail.dart';

import '../../utils/AppColors.dart';
import '../../utils/Constants.dart';

class SterileDetailPage extends StatefulWidget {
  SterileDetailPage({Key? key}) : super(key: key);

  @override
  State<SterileDetailPage> createState() => _SterileDetailPageState();
}

class _SterileDetailPageState extends State<SterileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: AppColors.COLOR_GREEN,
        centerTitle: true,
        title: Text(
          '${Constants.STERILE_TITLE}',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.COLOR_WHITE,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.COLOR_GREEN,
            child: customDetail(
                'header_sterile.png', 'home_sterile.png', context)),
      ),
    );
  }
}
