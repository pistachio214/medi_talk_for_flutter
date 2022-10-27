import 'package:flutter/material.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';

class DoctorItemWidget extends StatefulWidget {
  const DoctorItemWidget({
    Key? key,
    required this.size,
    required this.topMargin,
  }) : super(key: key);

  final Size size;

  final double topMargin;

  @override
  State<DoctorItemWidget> createState() => _DoctorItemWidgetState();
}

class _DoctorItemWidgetState extends State<DoctorItemWidget> {
  void _messageDetail() {
    Navigator.pushNamed(context, Routers.MESSAGE_DETAIL);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: widget.size.width - 25 * 2,
      height: 80,
      margin: EdgeInsets.only(top: widget.topMargin),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () => _messageDetail(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
              ),
              //超出部分，可裁剪
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Const.defaultBarAndBodyThemColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.asset(
                "assets/images/doctor-item.png",
                width: 55,
                height: 55,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: widget.size.width - 25 * 2 - 70 - 115,
              margin: const EdgeInsets.symmetric(vertical: 16.5),
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Chatars Nal",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Const.defaultFontColor,
                    ),
                  ),
                  const SizedBox(
                    child: Text(
                      "Bone Specialist 1223 312 3213 3213",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(25, 59, 104, 0.6),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: 60,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "10:30",
                      style: TextStyle(
                        color: Color.fromRGBO(25, 59, 104, 0.6),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    //超出部分，可裁剪
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Const.defaultSystemThemeColor,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
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
