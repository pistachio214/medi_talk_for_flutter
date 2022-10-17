import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/utils/shared_preferences_util.dart';
import 'package:medi_talk_for_flutter/widgets/from/login_and_sign_input_widget.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/login_and_sign_input_state.dart';
import 'package:medi_talk_for_flutter/widgets/login_or_signup/login_or_signup_view_widget.dart';

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
    return LoginOrSignupViewWidget(
      title: "Log in",
      actionButtonText: "Log in",
      actionButtonFunction: () => _loginSystem(),
      formWidget: Form(
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
      forgetVisible: true,
      forgetFunction: () {
        LogsUtil.info("忘记密码!");
      },
      accountVisible: true,
      accountFunction: () {
        Navigator.pushNamed(context, Routers.SIGN_UP);
      },
    );
  }
}
