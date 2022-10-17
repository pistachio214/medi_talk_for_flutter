import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/utils/shared_preferences_util.dart';
import 'package:medi_talk_for_flutter/widgets/from/login_and_sign_input_widget.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/login_and_sign_input_state.dart';

class InputState {
  late bool invalid;

  late final String value;

  InputState({this.invalid = false, this.value = ""});
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // 全局key 用来获取Form表单组件
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  late LoginAndSignInputState usernameState = LoginAndSignInputState(
    placeholder: "E-mail Address",
    required: true,
    // validator: (String? value) {
    //   return value != null && value.isNotEmpty ? null : "Please enter the username";
    // },
  );

  late LoginAndSignInputState passwordState = LoginAndSignInputState(
    placeholder: "Password",
    password: true,
    validator: (String? value) {
      return value != null && value.isNotEmpty ? null : "Please enter the Password";
    },
  );

  void _loginSystem() {

    var loginForm = loginKey.currentState;
    if (loginForm != null && loginForm.validate()) {
      loginForm.save();
      LogsUtil.info("${usernameState.value} --- ${passwordState.value}");

      SharedPreferencesUtil.preferences.setString("token", "12323");
      Navigator.pushNamed(context, Routers.MAIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 40),
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
            margin: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 40,
              bottom: 15,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: ColorUtil.hexToColor("#193B68"),
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  child: Form(
                    key: loginKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: LoginAndSignInputWidget(signInputState: usernameState),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          child: LoginAndSignInputWidget(signInputState: passwordState),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      LogsUtil.info("忘记密码");
                    },
                    child: const Text(
                      'Forget?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: size.width - 50,
                  height: 55,
                  decoration: BoxDecoration(
                    color: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
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
                    onPressed: () => _loginSystem(),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: ColorUtil.hexToColor("#FFFFFF"),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Haven't any account?",
                        style: TextStyle(
                          color: Color.fromRGBO(25, 59, 104, 0.7),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith((states) {
                            return Colors.transparent;
                          }),
                        ),
                        onPressed: () {
                          LogsUtil.info("前往注册");
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
