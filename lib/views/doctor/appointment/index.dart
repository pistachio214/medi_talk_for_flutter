import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Text("apple"),
          ),
        ),
      ),
    );
  }
}
