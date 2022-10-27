import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/views/main/appointment/index.dart';
import 'package:medi_talk_for_flutter/views/main/doctor/index.dart';
import 'package:medi_talk_for_flutter/views/main/home/index.dart';
import 'package:medi_talk_for_flutter/views/main/message/index.dart';
import 'package:medi_talk_for_flutter/widgets/main/main_bottom_navigation_bar_widget.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentIndex = 0;

  // 底部选项卡
  final List<BottomNavigationBarItem> bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "首页",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.book_online),
      label: "医生列表",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_business_rounded),
      label: "我的医生",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.message_sharp),
      label: "咨询列表",
    ),
  ];

  final List<Widget> tabBodies = <Widget>[
    const Home(),
    const Doctor(),
    const MyAppointment(),
    const MyMessage(),
  ];

  void _onTapHander(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: MainBottomNavigationBarWidget(
          bottomTabs: bottomTabs,
          onTapHander: (int index) => _onTapHander(index),
        ),
        body: tabBodies[currentIndex],
      ),
    );
  }
}
