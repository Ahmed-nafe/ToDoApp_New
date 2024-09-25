import 'package:flutter/material.dart';
import 'package:todonew/core/themes/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.autofocus = false,
    this.maxLines = 2,
    this.maxLength = 100,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool autofocus;
  final int maxLines;

  final int maxLength;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "You must Enter a task title";
          }
          if (value.length < 4) {
            return "You must Enter More than 4 Characters";
          }
          return null;
        },
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        maxLength: widget.maxLength,
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        minLines: 1,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primarygray,
            ),
          ),
          contentPadding: _isFocused == true
              ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
              : const EdgeInsets.only(
                  left: 10,
                ),
          labelText: widget.hintText,
        ),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
