import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/doctor_item_widget.dart';

class TopDoctorWarpWidget extends StatefulWidget {
  const TopDoctorWarpWidget({Key? key}) : super(key: key);

  @override
  State<TopDoctorWarpWidget> createState() => _TopDoctorWarpWidgetState();
}

class _TopDoctorWarpWidgetState extends State<TopDoctorWarpWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size.width - 25 * 2,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  child: Text(
                    "Top Doctor",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: ColorUtil.hexToColor("#193B68"),
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      LogsUtil.info("全部分类");
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width - 25 * 2,
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    double topMargin = 15.0;
                    if (index == 0) {
                      topMargin = 0;
                    }
                    return DoctorItemWidget(
                      size: size,
                      topMargin: topMargin,
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
