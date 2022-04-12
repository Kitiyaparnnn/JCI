import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/AppColors.dart';
import '../../utils/Constants.dart';
import '../../utils/CustomDetail.dart';

class CleanDetailPage extends StatefulWidget {
  CleanDetailPage({Key? key}) : super(key: key);

  @override
  State<CleanDetailPage> createState() => _CleanDetailPageState();
}

class _CleanDetailPageState extends State<CleanDetailPage> {
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
          backgroundColor: AppColors.COLOR_PRIMARY,
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
            color: AppColors.COLOR_PRIMARY,
            child: customDetail('header_clean.png', 'home_clean.png', context),
          ),
        ));
  }
}
