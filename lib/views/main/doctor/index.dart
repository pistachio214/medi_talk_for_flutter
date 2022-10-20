import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/doctor/doctor_item_widget.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  late int selectKey = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorUtil.hexToColor("#F6FAFF"),
      appBar: AppBar(
        title: Text(
          "Speclialist",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorUtil.hexToColor("#F6FAFF"),
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: () {},
              child: Image.asset(
                "assets/images/system/search.png",
                width: 22,
                height: 22,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            Container(
              height: 45,
              width: size.width - 25 * 2,
              margin: const EdgeInsets.only(bottom: 15),
              child: ScrollConfiguration(
                behavior: NoShadowScrollBehaviorHandle(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          int selfIndex = index + 1;

                          double rightMargin = 10.0;
                          Color defaultLabelColor = ColorUtil.hexToColor("#193B68");
                          Color defaultBackgroundColor = Colors.white;

                          if (selectKey == selfIndex) {
                            defaultBackgroundColor =
                                Const.defaultSystemThemeColor;
                            defaultLabelColor = Colors.white;
                          }
                          if (selfIndex == 10) {
                            rightMargin = 0.0;
                          }

                          return Container(
                            width: 120,
                            height: 45,
                            margin: EdgeInsets.only(right: rightMargin),
                            decoration: BoxDecoration(
                              color: defaultBackgroundColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectKey = selfIndex;
                                });
                              },
                              child: Text(
                                "Pediatrician",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: defaultLabelColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: size.height - 175,
              width: size.width - 25 * 2,
              padding: const EdgeInsets.only(bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        int selfIndex = index + 1;

                        double topMargin = 15;
                        if(selfIndex == 1){
                          topMargin = 0;
                        }

                        return DoctorItemWidget(
                          size: size,
                          topMargin: topMargin,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
