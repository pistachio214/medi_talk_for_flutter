import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class DoctorTagWidget extends StatefulWidget {
  const DoctorTagWidget({
    Key? key,
    required this.tagTitle,
    required this.tagImg,
    required this.tagContext,
  }) : super(key: key);

  final String tagTitle;

  final String tagImg;

  final String tagContext;

  @override
  State<DoctorTagWidget> createState() => _DoctorTagWidgetState();
}

class _DoctorTagWidgetState extends State<DoctorTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.tagTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(25, 59, 104, 0.7),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  widget.tagImg,
                  width: 20,
                  height: 20,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.tagContext,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
