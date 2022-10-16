import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String imgUrl;

  final String title;

  final String content;

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: ColorUtil.hexToColor("#193B68"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: size.width - 60,
                margin: const EdgeInsets.only(top: 10, bottom: 40),
                child: Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color.fromRGBO(25, 59, 105, 0.7),
                  ),
                ),
              ),
              Image.asset(
                widget.imgUrl,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
