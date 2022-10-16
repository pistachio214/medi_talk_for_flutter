import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
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
    // return WillPopScope(
    //     onWillPop: () async => false,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         elevation: 0,
    //         backgroundColor: ColorUtil.hexToColor("#F6FAFF"),
    //         centerTitle: false,
    //         title: Container(
    //           width: 200,
    //           height: 55,
    //           child: Row(
    //             children: <Widget>[
    //               Container(
    //                 height: 55,
    //                 width: 55,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(100),
    //                   image: const DecorationImage(
    //                     fit: BoxFit.fill,
    //                     image: AssetImage(
    //                       "assets/images/avatar.png",
    //                     ),
    //                   ),
    //                 ),
    //                 // child: Image.asset(
    //                 //   "assets/images/avatar.png",
    //                 //   width: 55,
    //                 //   height: 55,
    //                 //   fit: BoxFit.fill,
    //                 // ),
    //               )
    //             ],
    //           ),
    //         ),
    //         leadingWidth: 0,
    //         actions: <Widget>[
    //           Container(
    //             margin: const EdgeInsets.only(right: 15),
    //             child: Image.asset(
    //               "assets/images/system/search.png",
    //               width: 24,
    //               height: 24,
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(right: 20),
    //             child: Image.asset(
    //               "assets/images/system/notification.png",
    //               width: 24,
    //               height: 24,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ));
  }
}
