import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/doctor/doctor_tag_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/doctor/series_circle_widge.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({Key? key}) : super(key: key);

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  void _goDoctorAppointment() {
    Navigator.pushNamed(context, Routers.DOCTOR_APPOINTMENT);
  }

  // 上一页
  void _prevView() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double statusBarTopHeight = MediaQuery.of(context).padding.top;
    final double statusBarBottomHeight = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: statusBarTopHeight),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height - statusBarTopHeight,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: size.width,
                        height: 260 - statusBarTopHeight,
                        decoration: BoxDecoration(
                          color: Const.defaultBarAndBodyThemColor,
                        ),
                        child: Image.asset(
                          "assets/images/doctor2.png",
                          width: 245,
                          height: 260,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(),
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith((states) {
                              return Colors.transparent;
                            }),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          icon: const BackButtonIcon(),
                          onPressed: () => _prevView(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 185,
                      child: Container(
                        height: size.height - statusBarTopHeight - 185,
                        width: size.width,
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          color: ColorUtil.hexToColor("#F6FAFF"),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ScrollConfiguration(
                          behavior: NoShadowScrollBehaviorHandle(),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Mathew Cham",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 24,
                                            ),
                                          ),
                                          const Text(
                                            "Orthodontist,City Hospital",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Color.fromRGBO(25, 59, 104, 0.7),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Image.asset(
                                                "assets/images/system/location.png",
                                                width: 15,
                                                height: 15,
                                                fit: BoxFit.fitHeight,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(left: 5),
                                                child: const Text(
                                                  "Olmstead Rd",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(25, 59, 104, 0.8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: TextButton(
                                        style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.resolveWith((states) {
                                            return Colors.transparent;
                                          }),
                                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                                        ),
                                        onPressed: () {},
                                        child: Image.asset(
                                          "assets/images/system/chat.png",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const <Widget>[
                                      DoctorTagWidget(
                                        tagTitle: "Patients",
                                        tagImg: "assets/images/system/bx_bxs-user.png",
                                        tagContext: "580+",
                                      ),
                                      DoctorTagWidget(
                                        tagTitle: "Experience",
                                        tagImg: "assets/images/system/heroicons.png",
                                        tagContext: "4 yr+",
                                      ),
                                      DoctorTagWidget(
                                        tagTitle: "Rating",
                                        tagImg: "assets/images/system/bx_bxs-star.png",
                                        tagContext: "4.8",
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        child: Text(
                                          "About",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: const Text(
                                          "Completely generate enterprise-wide platforms rather than one-to-onesystems. Intrinsicly archit multimedia based ...",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color.fromRGBO(25, 59, 104, 0.7),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                // 工作时间
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        child: Text(
                                          "Availability",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: const Text(
                                          "Mon - Fri: 07:00 - 16:30",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color.fromRGBO(25, 59, 104, 0.7),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                //头像堆叠
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        child: Text(
                                          "Reviews",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: const SeriesCircleWidget(),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 30,
                                    bottom: statusBarBottomHeight + 15,
                                  ),
                                  width: size.width - 25 * 2,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Const.defaultSystemThemeColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                                    ),
                                    onPressed: () => _goDoctorAppointment(),
                                    child: const Text(
                                      "Book an Appointmenr",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
