import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

// FIXME add padding problem
class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const TextInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
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
    return TextField(
      maxLines: 1,
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
          maxHeight: 52,
        ),
      ),
    );
  }
}
