import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';

class LoginOrSignupViewWidget extends StatefulWidget {
  const LoginOrSignupViewWidget({
    Key? key,
    required this.title,
    required this.actionButtonText,
    required this.actionButtonFunction,
    required this.formWidget,
    required this.forgetVisible,
    this.forgetFunction,
    required this.accountVisible,
    this.accountFunction,
  }) : super(key: key);

  final String title;

  final String actionButtonText;

  final Function actionButtonFunction;

  final Form formWidget;

  final bool forgetVisible;

  final Function? forgetFunction;

  final bool accountVisible;

  final Function? accountFunction;

  @override
  State<LoginOrSignupViewWidget> createState() => _LoginOrSignupViewWidgetState();
}

class _LoginOrSignupViewWidgetState extends State<LoginOrSignupViewWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Const.defaultSystemLogo,
            ),
            RichText(
              text: TextSpan(
                text: "medi",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: Const.defaultFontColor,
                ),
                children: [
                  TextSpan(
                    text: "talk",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Const.defaultSystemThemeColor,
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
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: widget.formWidget,
                  ),
                  Visibility(
                    visible: widget.forgetVisible,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith((states) {
                            return Colors.transparent;
                          }),
                        ),
                        onPressed: () {
                          if (widget.forgetFunction != null) {
                            widget.forgetFunction!();
                          }
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
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: size.width - 50,
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
                      onPressed: () => widget.actionButtonFunction(),
                      child: Text(
                        widget.actionButtonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.forgetVisible,
                    child: Container(
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
                              if (widget.accountFunction != null) {
                                widget.accountFunction!();
                              }
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
