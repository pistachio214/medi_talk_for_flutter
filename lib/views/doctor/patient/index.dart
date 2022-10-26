import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/widgets/from/patient_detail_input_widget.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/patient_input_state.dart';

class PatientDetail extends StatefulWidget {
  const PatientDetail({Key? key}) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  // 全局key 用来获取Form表单组件
  final GlobalKey<FormState> patientKey = GlobalKey<FormState>();

  late PatientInputState fullNameState = PatientInputState(
    placeholder: "Full Name",
    required: true,
  );

  late PatientInputState phoneState = PatientInputState(
    placeholder: "Phone",
    required: true,
    keyboardType: TextInputType.phone,
  );

  late PatientInputState emailState = PatientInputState(
    placeholder: "Email Address",
    required: false,
  );

  late PatientInputState ageState = PatientInputState(
    placeholder: "Age",
    controller: TextEditingController(),
    required: false,
    suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
  );

  late PatientInputState genderState = PatientInputState(
    placeholder: "Gender",
    controller: TextEditingController(),
    required: false,
    suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
  );

  late PatientInputState visitingPurposeState = PatientInputState(
    placeholder: "Visiting Purpose",
    required: false,
    maxLength: 300,
    maxLines: 5,
    counterTextState: true,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // 界面左右间隔
    const double horizontal = 25.0;

    // age 和 gender 宽度
    final double halfWidth = (size.width - horizontal * 2) * 0.5 - 2.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patient's Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Const.defaultBarAndBodyThemColor,
        elevation: 0,
      ),
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: Container(
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: horizontal),
        child: ScrollConfiguration(
          behavior: NoShadowScrollBehaviorHandle(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: patientKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: PatientDetailInputWidget(inputState: fullNameState),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: PatientDetailInputWidget(inputState: phoneState),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: PatientDetailInputWidget(inputState: emailState),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: SizedBox(
                            width: halfWidth,
                            child: AbsorbPointer(
                              child: PatientDetailInputWidget(inputState: ageState),
                            ),
                          ),
                          onTap: () {
                            ageState.controller!.text = "29";
                          },
                        ),
                        InkWell(
                          child: SizedBox(
                            width: halfWidth,
                            child: AbsorbPointer(
                              child: PatientDetailInputWidget(inputState: genderState),
                            ),
                          ),
                          onTap: () {
                            genderState.controller!.text = "男";
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: PatientDetailInputWidget(inputState: visitingPurposeState),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Const.defaultSystemThemeColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
