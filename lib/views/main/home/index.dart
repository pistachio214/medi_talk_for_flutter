import 'package:flutter/material.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/categories_warp_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/doctor_banner_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/doctor_item_widget.dart';
import 'package:medi_talk_for_flutter/widgets/main/home/top_doctor_warp_widget.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: <Widget>[
              // 头像和通知栏
              UserAndNotificationWidget(size: size),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const DoctorBannerWidget(),
                      ),

                      // Categories
                      const CategoriesWarpWidget(),

                      // Top Doctor
                      const TopDoctorWarpWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
