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
  void _doctorDetail() {
    LogsUtil.info("doctor detail");
    Navigator.pushNamed(context, Routers.DOCTOR_DETAIL);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: widget.size.width - 25 * 2,
      height: 100,
      margin: EdgeInsets.only(top: widget.topMargin),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () => _doctorDetail(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Const.defaultBarAndBodyThemColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset(
                "assets/images/doctor-item.png",
                width: 80,
                height: 70,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: widget.size.width - 25 * 2 - 70 - 115,
              margin: const EdgeInsets.symmetric(vertical: 16.5),
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Chatars Nal",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Const.defaultFontColor,
                    ),
                  ),
                  const Text(
                    "Bone Specialist",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(25, 59, 104, 0.6),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/system/location.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "Olmstead Rd",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color.fromRGBO(25, 59, 104, 0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 80,
              height: 60,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 15),
              child: AbsorbPointer(
                // AbsorbPointer禁止点击星星功能
                child: CustomRating(
                  score: 3,
                  max: 5,
                  star: Star(
                    num: 5,
                    fat: 0.5,
                    size: 15,
                    emptyColor: const Color(0xffe7e8ea),
                    fillColor: ColorUtil.hexToColor("#FFBB23"),
                  ),
                  onRating: (_) {
                    LogsUtil.info("$_");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
