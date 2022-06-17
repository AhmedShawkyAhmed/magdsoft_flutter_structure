import 'package:flutter/material.dart';

// FIXME add padding problem
class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  const TextInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator,
      required this.obscureText})
      : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late bool _obscureText = false;
  @override
  void initState() {
    if (widget.obscureText) {
      _obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      validator: widget.validator,
      obscureText: _obscureText,
      style: const TextStyle(
        fontSize: 16,
        textBaseline: TextBaseline.alphabetic,
      ),
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,

      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.obscureText
            ? IconButton(
                highlightColor: Colors.transparent,
                icon: Icon(
                    !_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                splashColor: Colors.transparent,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        constraints: const BoxConstraints(
          maxWidth: 320,
          minWidth: 286,
          minHeight: 52,
        ),
      ),
    );
  }
}

extension Validator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return isNotEmpty;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
