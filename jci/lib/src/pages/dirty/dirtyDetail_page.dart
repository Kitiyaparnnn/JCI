import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci/src/utils/CustomDetail.dart';

import '../../utils/AppColors.dart';
import '../../utils/Constants.dart';

class DirtyDetailPage extends StatefulWidget {
  DirtyDetailPage({Key? key}) : super(key: key);

  @override
  State<DirtyDetailPage> createState() => _DirtyDetailPageState();
}

class _DirtyDetailPageState extends State<DirtyDetailPage> {
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
        backgroundColor: AppColors.COLOR_RED,
        centerTitle: true,
        title: Text(
          '${Constants.DIRTY_TITLE}',
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
          color: AppColors.COLOR_RED,
          child: customDetail('header_dirty.png', 'home_dirty.png', context),
        ),
      ),
    );
  }
}
