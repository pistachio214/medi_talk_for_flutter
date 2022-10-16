import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class UserAndNotificationWidget extends StatefulWidget {
  const UserAndNotificationWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<UserAndNotificationWidget> createState() =>
      _UserAndNotificationWidgetState();
}

class _UserAndNotificationWidgetState extends State<UserAndNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: widget.size.width,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 头像
          SizedBox(
            child: Row(
              children: <Widget>[
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/avatar.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: "Hi,",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                color: ColorUtil.hexToColor("#193B68"),
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                    text: "Ferdous",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                      color: ColorUtil.hexToColor("#193B68"),
                                    ))
                              ]),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "How is your health?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(25, 59, 104, 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    "assets/images/system/search.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Image.asset(
                    "assets/images/system/notification.png",
                    width: 24,
                    height: 24,
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
