import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final Widget? label;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: _focusNode,
      decoration: InputDecoration(
        label: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
