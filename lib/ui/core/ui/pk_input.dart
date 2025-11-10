import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/themes/colors.dart';

class PkInput extends StatefulWidget {

  final String? text;
  final String? hint;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;
  final TextInputAction inputAction;

  const PkInput({super.key, this.text, this.hint, this.onChanged, this.onSubmitted, this.inputAction = TextInputAction.done});

  @override
  State<PkInput> createState() => _PkInputState();
}

class _PkInputState extends State<PkInput> {

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text ?? "");
    _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
  }

  @override
  Widget build(BuildContext context) {

    String hint = widget.hint ?? "";
    Function(String)? onChanged = widget.onChanged;
    Function(String)? onSubmitted = widget.onSubmitted;
    final TextInputAction inputAction = widget.inputAction;

    return TextField(
      controller: _controller,
      decoration: _decorator.copyWith(hintText: hint),
      style: _textStyle,
      textInputAction: inputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }

  static final _textStyle = TextStyle(
      fontWeight: FontWeight.bold, 
      color: PkColors.tf_text,
  );

  static final _hintTextStyle = TextStyle(
    fontWeight: FontWeight.normal, 
    color: const Color(0xFF969696),
  ); 

  static final _decorator = InputDecoration(
    filled: true,
    fillColor: PkColors.tf_background, 
    hintStyle: _hintTextStyle,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: PkColors.tf_text,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: PkColors.tf_text,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: PkColors.tf_text,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: PkColors.tf_border_enabled,
        width: 2,
      ),
    ),
  );

}