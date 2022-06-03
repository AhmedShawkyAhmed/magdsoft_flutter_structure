import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/resources/strings_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import '../styles/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.type = TextInputType.name,
    this.isPassword = false,
  }) : super(key: key);

  final String hint;
  final Function onChanged;
  final TextInputType type;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p36, vertical: AppPadding.p8),
        child: TextFormField(
          keyboardType: widget.type,
          obscureText: _passwordVisible && widget.isPassword,
          validator: (value) {
            if (value!.isEmpty) return AppStrings.valueEmpty.tr();
            return null;
          },
          onChanged: (value) {
            widget.onChanged(value);
          },
          decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null),
        ));
  }
}
