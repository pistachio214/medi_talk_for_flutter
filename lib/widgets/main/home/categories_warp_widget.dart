import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/categories_item_widget.dart';

class CategoriesWarpWidget extends StatefulWidget {
  const CategoriesWarpWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWarpWidget> createState() => _CategoriesWarpWidgetState();
}

class _CategoriesWarpWidgetState extends State<CategoriesWarpWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 130,
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
                const SizedBox(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      LogsUtil.info("全部分类");
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Const.defaultSystemThemeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width - 25 * 2,
            height: 95,
            child: ScrollConfiguration(
              behavior: NoShadowScrollBehaviorHandle(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        double rightMargin = 10;
                        if (index == (10 - 1)) {
                          rightMargin = 0;
                        }

                        return CategoriesItemWidget(
                          title: "Cardiology$index",
                          imgUrl: "assets/images/heart.png",
                          rightMargin: rightMargin,
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
