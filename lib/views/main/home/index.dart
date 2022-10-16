import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/user_and_notification_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          // 头像和通知栏
          UserAndNotificationWidget(size: size),
          // banner container
          Container(
            margin: const EdgeInsets.only(top: 25),
            color: Colors.lightBlueAccent,
            child: SizedBox(
              height: 150,
              child: Swiper(
                key: UniqueKey(),
                index: 0,
                itemCount: 4,
                autoplay: false,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 270,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/system/banner-bg.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Image.asset("assets/images/landing1.png"),
                  );
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
            ),
          )
        ],
      ),
    );
  }
}
