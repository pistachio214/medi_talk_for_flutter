import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';

class DoctorBannerWidget extends StatefulWidget {
  const DoctorBannerWidget({Key? key}) : super(key: key);

  @override
  State<DoctorBannerWidget> createState() => _DoctorBannerWidgetState();
}

class _DoctorBannerWidgetState extends State<DoctorBannerWidget> {
  // 构建banner中的医生组件
  Widget _buildDoctorWidget() {
    return Container(
      width: 270,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage("assets/images/system/banner-bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 25,
          top: 10,
          bottom: 0,
        ),
        // color: Colors.deepOrangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 15,
                    ),
                    child: const Text(
                      "Dr.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                    ),
                    child: const Text(
                      "Raisa Lee",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                    ),
                    child: const Text(
                      "Odontologist",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Const.defaultSystemThemeColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/doctor.png",
                width: 110,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Swiper(
        key: UniqueKey(),
        index: 0,
        itemCount: 4,
        autoplay: false,
        itemBuilder: (BuildContext context, int index) {
          return _buildDoctorWidget();
        },
        duration: 3000,
        viewportFraction: 0.8,
        scale: 0.8,
        pagination: null,
        control: null,
        onTap: (int index) {
          LogsUtil.info("点击的轮播图");
        },
      ),
    );
  }
}
