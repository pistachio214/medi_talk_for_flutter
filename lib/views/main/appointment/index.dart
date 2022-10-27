import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/widgets/main/appointment/doctor_item_widget.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  late int selectKey = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Const.defaultBarAndBodyThemColor,
          title: const Text(
            "My Appointment",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Const.defaultBarAndBodyThemColor,
        body: Container(
          width: size.width,
          height: size.height,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              Container(
                height: 55,
                width: size.width - 25 * 2,
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 55,
                      decoration: BoxDecoration(
                        color: selectKey == 0 ? Const.defaultSystemThemeColor : Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectKey = 0;
                          });
                        },
                        child: Text(
                          "离线",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: selectKey == 0 ? Colors.white : null,
                            // color: defaultLabelColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 55,
                      decoration: BoxDecoration(
                        color: selectKey == 1 ? Const.defaultSystemThemeColor : Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectKey = 1;
                          });
                        },
                        child: Text(
                          "在线",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: selectKey == 1 ? Colors.white : null,
                            // color: defaultLabelColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height - 185,
                width: size.width - 25 * 2,
                padding: const EdgeInsets.only(bottom: 10),
                child: ScrollConfiguration(
                  behavior: NoShadowScrollBehaviorHandle(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            int selfIndex = index + 1;

                            double topMargin = 15;
                            if (selfIndex == 1) {
                              topMargin = 0;
                            }

                            return DoctorItemWidget(
                              size: size,
                              topMargin: topMargin,
                              status: 0,
                              selectKey: selectKey,
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
      ),
    );
  }
}
