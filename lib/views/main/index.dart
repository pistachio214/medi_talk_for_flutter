import 'package:flutter/material.dart';

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
          leading: TextButton(
            onPressed: () {},
            child: Image.asset(
              "assets/images/system/menu-line-1.png",
              width: 25,
              height: 25,
            ),
          ),
          actions: <Widget>[
            Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                "assets/images/avatar.png",
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
