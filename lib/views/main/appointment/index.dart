import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: null,
      ),
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          alignment: Alignment.center,
          child: Text("我的医生"),
        ),
      ),
    );
  }
}
