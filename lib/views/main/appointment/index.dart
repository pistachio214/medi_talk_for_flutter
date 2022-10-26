import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/doctor/doctor_item_widget.dart';

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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            // selectKey = selfIndex;
                          });
                        },
                        child: const Text(
                          "Upcoming",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            // color: defaultLabelColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            // selectKey = selfIndex;
                          });
                        },
                        child: const Text(
                          "Past",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            // color: defaultLabelColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height - 175,
                width: size.width - 25 * 2,
                padding: const EdgeInsets.only(bottom: 10),
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
                          );
                        },
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
