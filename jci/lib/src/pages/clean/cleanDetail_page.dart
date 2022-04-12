import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/AppColors.dart';
import '../../utils/Constants.dart';

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 100,
                  width: 200,
                  alignment: Alignment.topLeft,
                  child: Text(
                    Constants.TEXT_DETAIL,
                    style:
                        TextStyle(color: AppColors.COLOR_WHITE, fontSize: 12),
                  ),
                ),
              )
            ]),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColors.COLOR_WHITE,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                            Constants.TEXT_DESCRIBE,
                            style: TextStyle(fontSize: 12)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Lorem Ipsum',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color: AppColors.COLOR_GREY,
                                  ),
                              itemCount: 5,
                              itemBuilder: (context, index) => ListTile(
                                  leading: Image.asset(
                                      "${Constants.IMAGE_DIR}/home_clean.png"),
                                  title: Row(
                                    children: [
                                      Text('Lorem ipsum dolor',
                                          style: TextStyle(fontSize: 16)),
                                      Spacer(),
                                      Text(
                                        '3 days',
                                        style: TextStyle(
                                            color: AppColors.COLOR_GREY,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(Icons.calendar_month_rounded),
                                      Text('12/08/2021',
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ))),
                        )
                      ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}