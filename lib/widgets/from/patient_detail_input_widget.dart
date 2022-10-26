import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';
import 'package:medi_talk_for_flutter/widgets/from/state/patient_input_state.dart';

class PatientDetailInputWidget extends StatefulWidget {
  const PatientDetailInputWidget({Key? key, required this.inputState}) : super(key: key);

  final PatientInputState inputState;

  @override
  State<PatientDetailInputWidget> createState() => _PatientDetailInputWidgetState();
}

class _PatientDetailInputWidgetState extends State<PatientDetailInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.inputState.maxLength,
      maxLines: widget.inputState.maxLines,
      controller: widget.inputState.controller,
      keyboardType: widget.inputState.keyboardType,
      decoration: InputDecoration(
        hintText: widget.inputState.placeholder,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(25, 59, 104, 0.5),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(25, 59, 104, 0.2),
            width: 1.5,
          ),
        ),
        counterText: widget.inputState.counterTextState ? null : "",
        suffixIcon: widget.inputState.suffixIcon,
      ),
      validator: (String? value) {
        if (!widget.inputState.required) {
          return null;
        }

        if (widget.inputState.validator == null) {
          if (value != null) {
            if (value.trim().isNotEmpty) {
              return null;
            }
          }
          return "Please enter ${widget.inputState.placeholder}";
        }

        return widget.inputState.validator!(value);
      },
      onSaved: (String? value) {
        widget.inputState.value = value ?? "";
      },
    );
  }
}
