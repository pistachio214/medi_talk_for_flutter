import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  // 上一页
  void _prevView() {
    Navigator.of(context).pop();
  }

  void _patientDetail() {
    Navigator.pushNamed(context, Routers.PATIENT_IS_DETAILS);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointment",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Const.defaultBarAndBodyThemColor,
        elevation: 0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const BackButtonIcon(),
          onPressed: () => _prevView(),
        ),
      ),
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: Container(
        width: size.width,
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        child: ScrollConfiguration(
          behavior: NoShadowScrollBehaviorHandle(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 155,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Hospital",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Const.defaultFontColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Online",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Const.defaultFontColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Categories
                      Container(
                        height: 130,
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 30,
                              margin: const EdgeInsets.only(bottom: 15),
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                child: Text(
                                  "July",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Const.defaultFontColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width - 25 * 2,
                              height: 80,
                              child: ScrollConfiguration(
                                behavior: NoShadowScrollBehaviorHandle(),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListView.builder(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          double rightMargin = 10;
                                          if (index == (10 - 1)) {
                                            rightMargin = 0;
                                          }

                                          return Container(
                                            width: 80,
                                            height: 80,
                                            margin: EdgeInsets.only(right: rightMargin),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Mon",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 18,
                                                      color: Const.defaultFontColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 7),
                                                    child: const Text(
                                                      "15",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Color.fromRGBO(25, 59, 104, 0.6),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
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
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 30,
                              margin: const EdgeInsets.only(bottom: 15),
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                child: Text(
                                  "Available Slots",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Const.defaultFontColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              width: size.width - 25 * 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 55,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Morning",
                                        style: TextStyle(
                                          color: Const.defaultFontColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 55,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Afternoon",
                                        style: TextStyle(
                                          color: Const.defaultFontColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 55,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Evening",
                                        style: TextStyle(
                                          color: Const.defaultFontColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
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
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(
                                  6,
                                  (index) {
                                    return Container(
                                      width: 75,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "09:00 am",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(25, 59, 104, 0.7),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 30,
                              margin: const EdgeInsets.only(bottom: 15),
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                child: Text(
                                  "Consultation Fees",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Const.defaultFontColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width - 25 * 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.chat_sharp,
                                            size: 24,
                                            color: Const.defaultSystemThemeColor,
                                          ),
                                          Text(
                                            "Messaging",
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '\$ 5',
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.phone_sharp,
                                            size: 24,
                                            color: Const.defaultSystemThemeColor,
                                          ),
                                          Text(
                                            "Voice Call",
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '\$ 10',
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.videocam_sharp,
                                            size: 24,
                                            color: Const.defaultSystemThemeColor,
                                          ),
                                          Text(
                                            "Video Call",
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '\$ 20',
                                            style: TextStyle(
                                              color: Const.defaultFontColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Const.defaultSystemThemeColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                    onPressed: () => _patientDetail(),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
