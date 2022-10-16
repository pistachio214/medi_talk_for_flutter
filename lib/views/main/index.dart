import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorUtil.hexToColor("#F6FAFF"),
            centerTitle: false,
            title: Container(
              color: Colors.amber,
              width: 200,
              height: 55,
              child: const Text("!3213"),
            ),
            leadingWidth: 0,
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/images/system/search.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/images/system/notification.png",
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ));
  }
}
