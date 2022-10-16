import 'package:flutter/material.dart';
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

    return SafeArea(
      child: Column(
        children: <Widget>[
          // 头像和通知栏
          UserAndNotificationWidget(size: size),
          // banner container
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const DoctorBannerWidget(),
          )
        ],
      ),
    );
  }
}
