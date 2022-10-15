import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class InputState {
  final bool invalid = false;

  final String value = "";
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late InputState username = InputState();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fitWidth,
              width: 100,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "medi",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 17,
                color: ColorUtil.hexToColor("#193B68"),
              ),
              children: [
                TextSpan(
                  text: "talk",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: const EdgeInsets.only(top: 40, left: 25),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: ColorUtil.hexToColor("#193B68"),
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '用户名',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      errorText: username.invalid ? '请输入用户名' : null,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
