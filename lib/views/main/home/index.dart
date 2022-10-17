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
                      height: 125,
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
                                        color: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
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
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // ListView.builder(
                                    //   itemBuilder: (BuildContext context, int index) {
                                    //     return Container(
                                    //       width: 80,
                                    //       height: 75,
                                    //       margin: const EdgeInsets.only(top: 15),
                                    //       color: Colors.purpleAccent,
                                    //     );
                                    //   },
                                    //   itemCount: 3,
                                    //   shrinkWrap: true,
                                    // ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 75,
                                      margin: const EdgeInsets.only(top: 15),
                                      color: Colors.purpleAccent,
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
