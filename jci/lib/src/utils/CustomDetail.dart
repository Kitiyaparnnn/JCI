import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'Constants.dart';

Widget customDetail(String header, String title, BuildContext context) {
  return Stack(children: [
    Align(
      alignment: Alignment.topRight,
      child: SizedBox(
          width: header == 'header_sterile.png'
              ? .7 * MediaQuery.of(context).size.width
              : .6 * MediaQuery.of(context).size.width,
          child: Image.asset(
            "${Constants.IMAGE_DIR}/$header",
          )),
    ),
    Padding(
      padding: header == 'header_sterile.png'
          ? EdgeInsets.only(left: 20)
          : EdgeInsets.only(left: 20, top: 20),
      child: Container(
        height: 100,
        width: 200,
        alignment: Alignment.topLeft,
        child: Text(
          Constants.TEXT_DETAIL,
          style: TextStyle(color: AppColors.COLOR_WHITE, fontSize: 12),
        ),
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: .64 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: AppColors.COLOR_WHITE,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Lorem Ipsum',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Text(Constants.TEXT_DESCRIBE, style: TextStyle(fontSize: 12)),
            SizedBox(
              height: 30,
            ),
            Text(
              'Lorem Ipsum',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  leading: Image.asset("${Constants.IMAGE_DIR}/$title"),
                  title: Row(
                    children: [
                      Text('Lorem ipsum dolor', style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Text(
                        '3 days',
                        style: TextStyle(
                            color: AppColors.COLOR_GREY, fontSize: 14),
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.calendar_month_rounded),
                      Text('12/08/2021', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    )
  ]);
}
