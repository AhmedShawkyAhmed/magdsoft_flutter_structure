import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../styles/colors.dart';
import '../styles/style.dart';

// ignore: camel_case_types
class buildInputTF extends StatefulWidget {
  const buildInputTF(
      {required this.myFocusNode,
      required this.icon,
      required this.title,
      required this.onTap,
      this.initialValue,
      this.isEditFunc,
      this.isEdit,
      this.hint,
      this.errorColor,
      this.validator,
      this.messageError,
      this.onSave,
      this.onChange});

  final FocusNode myFocusNode;
  final bool? isEdit;
  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final String title;
  final String? hint;
  final bool? messageError;
  final Function() onTap;
  final Function(String?)? onSave;
  final Function(String)? onChange;
  final Color? errorColor;
  final String? initialValue;
  final Function()? isEditFunc;

  @override
  _buildInputTFState createState() => _buildInputTFState();
}

// ignore: camel_case_types
class _buildInputTFState extends State<buildInputTF> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.myFocusNode.hasFocus
                  ? AppColors.buttonTextColor
                  : AppColors.buttonTextColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  initialValue: widget.initialValue,
                  onSaved: widget.onSave,
                  validator: widget.validator,
                  onChanged: widget.onChange,
                  onTap: widget.onTap,
                  focusNode: widget.myFocusNode,
                  cursorColor: AppColors.primaryColor,
                  cursorWidth: 3,
                  style: TextStyle(
                    color: widget.myFocusNode.hasFocus
                        ? AppColors.buttonTextColor
                        : AppColors.buttonTextColor,
                    fontSize: smallTextSize,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: AppColors.buttonTextColor,
                        fontSize: smallTextSize),
                    hintText: widget.hint,
                    labelStyle: TextStyle(
                      color: AppColors.buttonTextColor,
                      fontSize: smallTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                    hoverColor: AppColors.buttonTextColor,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        color: widget.myFocusNode.hasFocus
                            ? AppColors.buttonBorderColor
                            : AppColors.buttonTextColor,
                        width: 1.8,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                          color: widget.myFocusNode.hasFocus
                              ? AppColors.buttonBorderColor
                              : AppColors.buttonTextColor,
                          width: 1.5),
                    ),
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 10.0),
                  ),
                ),
              ),
              // Expanded(
              //   flex: widget.isEdit! ? 1 : 0,
              //   child: Visibility(
              //     visible: widget.isEdit!,
              //     child: GestureDetector(
              //       onTap: widget.isEditFunc,
              //       child: Container(
              //         height:  widget.isEdit! ? 50 : 0,
              //         child: Center(child: ChangeTextStyleSmall(title: "Edit", color: whiteColor, textAlign: TextAlign.center, fontWeight: FontWeight.w500,)),
              //         decoration: BoxDecoration(
              //           color: primaryColor,
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(5),
              //               bottomRight: Radius.circular(5)),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class buildInputPasswordTF extends StatefulWidget {
  buildInputPasswordTF(
      {required this.myFocusNode,
      required this.title,
      required this.onTap,
      this.errorColor,
      this.validator,
      this.onSave,
      this.onChange});

  final FocusNode myFocusNode;
  final FormFieldValidator? validator;
  final String title;
  final Function() onTap;
  final Function(String)? onChange;
  final Function(String?)? onSave;
  final Color? errorColor;
  var obscureText = true;

  @override
  _buildInputPasswordTFState createState() => _buildInputPasswordTFState();
}

// ignore: camel_case_types
class _buildInputPasswordTFState extends State<buildInputPasswordTF> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.myFocusNode.hasFocus
                  ? AppColors.buttonTextColor
                  : AppColors.buttonTextColor,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        ),
        Container(
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              TextFormField(
                validator: widget.validator,
                onSaved: widget.onSave,
                onChanged: widget.onChange,
                obscureText: widget.obscureText,
                onTap: widget.onTap,
                focusNode: widget.myFocusNode,
                cursorColor: AppColors.primaryColor,
                cursorWidth: 3,
                style: TextStyle(
                  color: widget.myFocusNode.hasFocus
                      ? AppColors.inputFieldColor
                      : AppColors.inputFieldColor,
                  fontSize: xSmallTextSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Tomorrow",
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: xSmallTextSize,
                  ),
                  hoverColor: Colors.grey,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                    borderSide: BorderSide(
                        color: AppColors.buttonBorderColor, width: 1.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
//              icon: Icon( flutt.MaterialCommunityIcons.lock_outline,),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 10.0),
                ),
              ),
              IconButton(
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.buttonTextColor,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/////////// frop dwon
