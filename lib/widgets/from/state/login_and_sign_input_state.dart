class LoginAndSignInputState {

  // 输入框框内容
  late String value;

  // 默认显示
  late String placeholder;

  // 是否密码框 true 是 / false 不是
  final bool password;

  // 是否必填 default true
  final bool required;

  late String? Function(String?)? validator;

  LoginAndSignInputState({
    this.value = "",
    this.placeholder = "请输入",
    this.password = false,
    this.required = true,
    this.validator,
  });
}
