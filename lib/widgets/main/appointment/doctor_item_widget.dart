import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class DoctorItemWidget extends StatefulWidget {
  const DoctorItemWidget({
    Key? key,
    required this.size,
    required this.topMargin,
    required this.status,
    required this.selectKey,
  }) : super(key: key);

  final Size size;

  final double topMargin;

  final int status;

  final int selectKey;

  @override
  State<DoctorItemWidget> createState() => _DoctorItemWidgetState();
}

class _DoctorItemWidgetState extends State<DoctorItemWidget> {
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
        onPressed: () {},
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
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/system/Calendar.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            "16 July,2022",
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
              child: _buildAction(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction() {
    String text = "";
    TextStyle textStyle = const TextStyle();
    switch(widget.selectKey){
      case 0:
        text = "Cancel";
        textStyle = TextStyle(
          color: ColorUtil.hexToColor("#FF4848"),
          fontWeight: FontWeight.w700,
          fontSize: 12,
        );
        break;
      case 1:
        text = "Reschdedule";
        textStyle = TextStyle(
          color: ColorUtil.hexToColor("#45BD9F"),
          fontWeight: FontWeight.w700,
          fontSize: 12,
        );
        break;
      default:

    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Container(
            width: 30,
            height: 30,
            //超出部分，可裁剪
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(20, 121, 255, 0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.videocam_sharp),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
