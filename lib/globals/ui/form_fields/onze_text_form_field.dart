// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/globals/constants/margin_constants.dart';
import 'package:todo/globals/constants/padding_constants.dart';
import 'package:todo/globals/constants/radius_constants.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/styles/onze_text_style.dart';

/// Classe que representa um campo de texto do Onze.
class OnzeTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final String? prefixText;
  final String? suffixText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool enabled;
  final bool isOptional;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? onTap;

  const OnzeTextFormField({
    Key? key,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.helperText,
    this.suffixText,
    this.initialValue,
    this.prefixText,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines = 1,
    this.suffixIcon,
    this.maxLength,
    this.enabled = true,
    this.isOptional = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  @override
  _OnzeTextFormFieldState createState() => _OnzeTextFormFieldState();
}

class _OnzeTextFormFieldState extends State<OnzeTextFormField> {
  bool isPassVisible = false;
  double underlineWidth = 1.3;

  @override
  Widget build(BuildContext context) {
    final labelText =
        widget.isOptional ? '${widget.labelText} (opcional)' : widget.labelText;

    const double gapPadding = 8;

    return Container(
      margin: const EdgeInsets.only(bottom: regularMargin),
      child: TextFormField(
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        controller: widget.controller,
        enabled: widget.enabled,
        initialValue: widget.initialValue,
        maxLines: widget.maxLines,
        textInputAction: TextInputAction.done,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        style: OnzeTextStyle.form(),
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.inputFormatters,
        autocorrect: false,
        cursorHeight: 17,
        cursorColor: OnzeColors.primaryRegular,
        decoration: InputDecoration(
          prefixText: widget.prefixText,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: mediumPadding, vertical: 17),
          helperText: widget.helperText,
          helperStyle: OnzeTextStyle.labelMedium(),
          suffixText: widget.suffixText,
          hintText: widget.hintText,
          errorStyle: OnzeTextStyle.formError(),
          hintStyle: OnzeTextStyle.formHint(),
          labelText: labelText,
          labelStyle: OnzeTextStyle.bodyMedium().copyWith(
            color: Colors.black,
            fontSize: 17,
          ),
          filled: false,
          enabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.circular(smallRadius),
            borderSide: BorderSide(
              color: OnzeColors.greyLight,
              width: underlineWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.circular(smallRadius),
            borderSide: BorderSide(
              color: Colors.black,
              width: underlineWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.circular(smallRadius),
            borderSide: BorderSide(
              color: Colors.red,
              width: underlineWidth,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            gapPadding: gapPadding,
            borderRadius: BorderRadius.circular(smallRadius),
            borderSide: BorderSide(
              color: OnzeColors.greyLightest,
              width: underlineWidth,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(smallRadius),
            borderSide: BorderSide(
              color: Colors.red,
              width: underlineWidth,
            ),
          ),
          errorMaxLines: 3,
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: widget.textCapitalization,
      ),
    );
  }
}
