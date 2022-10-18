import 'package:flutter/material.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({Key? key}) : super(key: key);

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("详情"),
      ),
    );
  }
}
