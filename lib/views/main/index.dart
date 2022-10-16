import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/views/main/home/index.dart';
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
      label: "医生"
    ),
  ];

  final List<Widget> tabBodies = <Widget>[
    const Home(),
    const Home(),
  ];

  void _onTapHander(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomNavigationBarWidget(
        bottomTabs: bottomTabs,
        onTapHander: (int index) => _onTapHander(index),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: tabBodies[currentIndex],
      ),
    );
  }
}
