import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
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
                    Container(
                      height: 130,
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
                                    "Categories",
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
                                        color: ColorUtil.hexToColor(
                                            Const.defaultSystemThemeColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width - 25 * 2,
                            height: 95,
                            child: ScrollConfiguration(
                              behavior: NoShadowScrollBehaviorHandle(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        double rightMargin = 10;
                                        if (index == (10 - 1)) {
                                          rightMargin = 0;
                                        }

                                        return Container(
                                          key: UniqueKey(),
                                          width: 80,
                                          height: 75,
                                          margin: EdgeInsets.only(
                                            top: 15,
                                            right: rightMargin,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            height: 45,
                                            width: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/heart.png",
                                                  width: 25,
                                                  height: 20,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                Text(
                                                  "Cardiology",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color: ColorUtil.hexToColor(
                                                        "#193B68"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: 10,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 150,
                      width: size.width,
                      color: Colors.blue,
                      margin: const EdgeInsets.only(top: 15),
                    ),

                    Container(
                      height: 350,
                      width: size.width,
                      color: Colors.blue,
                      margin: const EdgeInsets.only(top: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
