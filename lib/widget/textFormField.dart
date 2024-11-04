import 'package:flutter/material.dart';
import 'package:shoppy3/config/imports.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool password;
  final Color? colorBackground;
  final Function(String)? onChanged;
  final double? width;
  final double? height;
  final int? minLines;
  final int? maxLines;
  final BorderRadius? borderRadius;

  const TextFormFieldCustom({
    super.key,
    this.labelText = '',
    this.hintText = '',
    this.password = false,
    this.colorBackground = Colors.transparent,
    this.onChanged,
    this.width = 250.0,
    this.height,
    this.minLines,
    this.maxLines,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)), // Valor por defecto
  });

  @override
  _TextFormFieldCustomState createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        obscureText: widget.password ? !visible : false,
        onChanged: widget.onChanged,
        textCapitalization: TextCapitalization.sentences,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? (widget.password ? 1 : null),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: widget.colorBackground,
          suffixIcon: widget.password
              ? IconButton(
            icon: Icon(
              visible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius!,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius!,
            borderSide: BorderSide(color: COLOR_ACCENT),
          ),
        ),
      ),
    );
  }
}
