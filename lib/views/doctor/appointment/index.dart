import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/categories_item_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/categories_warp_widget.dart';

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
