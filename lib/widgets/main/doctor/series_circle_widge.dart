import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class SeriesCircleWidget extends StatefulWidget {
  const SeriesCircleWidget({Key? key}) : super(key: key);

  @override
  State<SeriesCircleWidget> createState() => _SeriesCircleWidgetState();
}

class _SeriesCircleWidgetState extends State<SeriesCircleWidget> {
  final double sizeW = 50.0;
  final double offsetW = 26.0;

  double _getImageStackWidth(int imageNumber) {
    return offsetW * (imageNumber) + sizeW;
  }

  List<Widget> _getStackItems(int count) {
    List<Widget> _list = <Widget>[];
    for (var i = 0; i < count; i++) {
      double off = 25.0 * i;
      _list.add(
        Positioned(
          left: off,
          child: CircleAvatar(
            backgroundColor: Const.defaultSystemThemeColor,
            child: Image(
              image: const AssetImage("assets/images/avatar.png"),
              width: sizeW,
              height: sizeW,
            ),
          ),
        ),
      );
    }
    return _list;
  }

  List<Widget> _generatorStackItems(int count, int num) {
    List<Widget> list = _getStackItems(count);

    list.add(
      Positioned(
        left: count * 25.0,
        child: CircleAvatar(
          backgroundColor: Const.defaultSystemThemeColor,
          child: SizedBox(
            child: Text(
              "$num+",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: _getImageStackWidth(8),
                  height: double.infinity,
                  child: Stack(
                    children: _generatorStackItems(8, 15),
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
