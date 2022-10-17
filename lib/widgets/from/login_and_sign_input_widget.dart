import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/login_and_sign_input_state.dart';

class LoginAndSignInputWidget extends StatefulWidget {
  const LoginAndSignInputWidget({Key? key, required this.signInputState}) : super(key: key);

  final LoginAndSignInputState signInputState;

  @override
  State<LoginAndSignInputWidget> createState() => _LoginAndSignInputWidgetState();
}

class _LoginAndSignInputWidgetState extends State<LoginAndSignInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 18,
      maxLines: 1,
      obscureText: widget.signInputState.password,
      decoration: InputDecoration(
        hintText: widget.signInputState.placeholder,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(25, 59, 104, 0.5),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(25, 59, 104, 0.2),
            width: 1.5,
          ),
        ),
        counterText: "",
      ),
      validator: (String? value) {
        if (!widget.signInputState.required) {
          return null;
        }

        if (widget.signInputState.validator == null) {
          if (value != null) {
            if (value.trim().isNotEmpty) {
              return null;
            }
          }
          return "Please enter ${widget.signInputState.placeholder}";
        }

        return widget.signInputState.validator!(value);
      },
      onSaved: (String? value) {
        widget.signInputState.value = value ?? "";
      },
    );
  }
}
