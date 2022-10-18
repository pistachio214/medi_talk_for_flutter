import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/categories_warp_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/doctor_banner_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/user_and_notification_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: <Widget>[
              // 头像和通知栏
              UserAndNotificationWidget(size: size),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const DoctorBannerWidget(),
                      ),

                      // Categories
                      const CategoriesWarpWidget(),

                      // Top Doctor
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: size.width - 25 * 2,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text(
                                      "Top Doctor",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                        color: ColorUtil.hexToColor("#193B68"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () {
                                        LogsUtil.info("全部分类");
                                      },
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color:
                                              ColorUtil.hexToColor(Const.defaultSystemThemeColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width - 25 * 2,
                              margin: const EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: size.width - 25 * 2,
                                    height: 80,
                                    alignment: Alignment.topLeft,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width: 80,
                                          height: 60,
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorUtil.hexToColor("#D0E4FF"),
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: ,
                                        ),
                                        Container(
                                          child: Text("名字"),
                                        ),
                                        Container(
                                          child: Text("星级"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                  Container(
                                    child: Text("第一个"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
