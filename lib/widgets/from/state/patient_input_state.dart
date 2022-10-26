import 'package:flutter/material.dart';

class PatientInputState {
  // 控制器
  late TextEditingController? controller;

  // 输入框框内容
  late String value;

  // 键盘类型
  late TextInputType? keyboardType;

  // 文字长度
  late int? maxLength;

  // 最大行数
  late int? maxLines;

  // 默认显示
  late String placeholder;

  // 是否必填 default true
  final bool required;

  // 是否显示右下角字数统计 true:显示   false:不显示
  late bool counterTextState;

  late Widget? suffixIcon;

  late String? Function(String?)? validator;

  PatientInputState({
    this.controller,
    this.value = "",
    this.keyboardType,
    this.placeholder = "请输入",
    this.required = true,
    this.counterTextState = false,
    this.validator,
    this.suffixIcon,
    this.maxLength = 18,
    this.maxLines = 1,
  });
}
