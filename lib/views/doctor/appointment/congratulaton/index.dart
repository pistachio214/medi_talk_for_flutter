import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';

class Congratulaton extends StatefulWidget {
  const Congratulaton({Key? key}) : super(key: key);

  @override
  State<Congratulaton> createState() => _CongratulatonState();
}

class _CongratulatonState extends State<Congratulaton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 110,
                        height: 100,
                        child: Image.asset(
                          "assets/images/system/chekck_mark.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: Text(
                          "Congratulaton!",
                          style: TextStyle(
                            color: Const.defaultFontColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Hey ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color.fromRGBO(25, 59, 104, 0.7),
                            ),
                            children: [
                              TextSpan(
                                text: "Ferdous,",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Const.defaultFontColor,
                                ),
                              ),
                              const TextSpan(
                                text: " your appointment with, ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color.fromRGBO(25, 59, 104, 0.7),
                                ),
                              ),
                              TextSpan(
                                text: "Dr. Mathew Cham",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Const.defaultFontColor,
                                ),
                              ),
                              const TextSpan(
                                text: " has been created.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color.fromRGBO(25, 59, 104, 0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // (
                        //   "Hey Ferdous, your appointment with Dr. Mathew Cham has been created.",
                        //   style: TextStyle(
                        //
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildItem("assets/images/system/Profile.png", "Ferdous Islam"),
                                buildItem("assets/images/system/Wallet.png", "20 USD"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                buildItem("assets/images/system/Calendar.png", "16 July,2022"),
                                buildItem("assets/images/system/Time_Circle.png", "10:00 am"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Const.defaultSystemThemeColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          onPressed: () {
                          },
                          child: const Text(
                            "See Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Const.defaultSystemThemeColor,
                            )),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Routers.MAIN);
                          },
                          child: Text(
                            "Dashboard",
                            style: TextStyle(
                              color: Const.defaultFontColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String icoImg, String title) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 125,
      child: Row(
        children: <Widget>[
          Image.asset(
            icoImg,
            width: 20,
            height: 20,
            fit: BoxFit.fitWidth,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Const.defaultFontColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
