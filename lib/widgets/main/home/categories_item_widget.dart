import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class CategoriesItemWidget extends StatefulWidget {
  const CategoriesItemWidget({
    Key? key,
    required this.title,
    required this.imgUrl,
    this.rightMargin,
  }) : super(key: key);

  final String title;

  final String imgUrl;

  final double? rightMargin;

  @override
  State<CategoriesItemWidget> createState() => _CategoriesItemWidgetState();
}

class _CategoriesItemWidgetState extends State<CategoriesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: 80,
      height: 75,
      margin: EdgeInsets.only(
        top: 15,
        right: widget.rightMargin ?? 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        height: 45,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              widget.imgUrl,
              width: 25,
              height: 20,
              fit: BoxFit.fitHeight,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: ColorUtil.hexToColor("#193B68"),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
