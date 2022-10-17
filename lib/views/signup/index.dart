import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/from/login_and_sign_input_widget.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/login_and_sign_input_state.dart';
import 'package:medi_talk_for_flutter/widgets/login_or_signup/login_or_signup_view_widget.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // 全局key 用来获取Form表单组件
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  late LoginAndSignInputState fullNameState = LoginAndSignInputState(
    placeholder: "Full Name",
    required: true,
  );

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

  late LoginAndSignInputState retypePasswordState = LoginAndSignInputState(
    placeholder: "Retype-Password",
    password: true,
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter the Retype-Password";
      }

      if (passwordState.value != value) {
        return "The two passwords are inconsistent";
      }

      return null;
    },
  );

  void _signUpSystem() {
    var loginForm = signUpKey.currentState;
    if (loginForm != null && loginForm.validate()) {
      loginForm.save();
      LogsUtil.info("${usernameState.value} --- ${passwordState.value}");

      Navigator.pushNamed(context, Routers.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginOrSignupViewWidget(
      title: "Sign up",
      actionButtonText: "Sign Up",
      actionButtonFunction: () => _signUpSystem(),
      formWidget: Form(
        key: signUpKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: LoginAndSignInputWidget(signInputState: fullNameState),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: LoginAndSignInputWidget(signInputState: usernameState),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: LoginAndSignInputWidget(signInputState: passwordState),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: LoginAndSignInputWidget(signInputState: retypePasswordState),
            ),
          ],
        ),
      ),
      forgetVisible: false,
      accountVisible: false,
    );
  }
}
