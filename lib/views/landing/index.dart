import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/lang/routers.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/widgets/landing/landing_widget.dart';
import 'package:medi_talk_for_flutter/utils/shared_preferences_util.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late bool isVisible = true;

  late String buttonText = "Next";

  final List<Widget> listLanding = [
    const LandingWidget(
      imgUrl: "assets/images/landing1.png",
      title: "Appointment in Anywhere",
      content:
          "Find the doctor & make appoinment near to your area or any others location",
    ),
    const LandingWidget(
      imgUrl: "assets/images/landing2.png",
      title: "Huge Specialist",
      content: "Lots of specialist what you need find in one place",
    ),
    const LandingWidget(
      imgUrl: "assets/images/landing3.png",
      title: "Online Doctor Support",
      content: "Get online support from aywhere by text / audio - video call",
    ),
  ];

  late final TabController _tabController =
      TabController(initialIndex: 0, length: listLanding.length, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      if (_tabController.index == (listLanding.length - 1)) {
        setState(() {
          isVisible = false;
          buttonText = "Get Started";
        });
      } else {
        setState(() {
          isVisible = true;
          buttonText = "Next";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TabBarView(
            controller: _tabController,
            children: listLanding,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabPageSelector(
                controller: _tabController,
                selectedColor:
                    ColorUtil.hexToColor(Const.defaultSystemThemeColor),
                indicatorSize: 12,
                color: const Color.fromRGBO(0, 0, 0, 0.17),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 200),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 260,
                height: 55,
                decoration: BoxDecoration(
                  color: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_tabController.index == (listLanding.length - 1)) {
                      SharedPreferencesUtil.preferences.setBool("fistOpen", true);
                      Navigator.of(context).pushNamed(Routers.MAIN);
                    } else {
                      int index = _tabController.index;
                      _tabController.index = index + 1;
                    }
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: ColorUtil.hexToColor("#FFFFFF"),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
