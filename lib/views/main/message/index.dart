import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/widgets/main/message/doctor_item_widget.dart';

class MyMessage extends StatefulWidget {
  const MyMessage({Key? key}) : super(key: key);

  @override
  State<MyMessage> createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Const.defaultBarAndBodyThemColor,
        title: const Text(
          "Message",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          height: size.height - 185,
          width: size.width - 25 * 2,
          padding: const EdgeInsets.only(bottom: 10),
          child: ScrollConfiguration(
            behavior: NoShadowScrollBehaviorHandle(),
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
                      if (selfIndex == 1) {
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
        ),
      ),
    );
  }
}
