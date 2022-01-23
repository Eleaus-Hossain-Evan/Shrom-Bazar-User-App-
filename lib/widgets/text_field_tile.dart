import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_app/variables/colors.dart';
import 'package:user_app/variables/config.dart';

class TextFieldBuilder extends StatefulWidget {
  const TextFieldBuilder({Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.obscure=false,this.textInputType,this.textCapitalization,this.prefixIcon}) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final bool obscure;

  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  bool _obscure=true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure? _obscure:false,
      keyboardType: widget.textInputType??TextInputType.text,
      textCapitalization: widget.textCapitalization??TextCapitalization.none,
      style: TextStyle(
        color: Clrs.textColor,
        fontSize: dynamicSize(.045),
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: dynamicSize(0.04),vertical: dynamicSize(0.02)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon!=null?Padding(
            padding: EdgeInsets.only(right: dynamicSize(.02)),
            child: Icon(widget.prefixIcon,size: dynamicSize(.06)),
          ):null,
          suffixIconConstraints: BoxConstraints.loose(size),
          prefixIconConstraints: BoxConstraints.loose(size),
          suffixIcon: widget.obscure
              ? InkWell(
            onTap: ()=>setState(()=> _obscure=!_obscure),
            child: Padding(
              padding: EdgeInsets.only(right: dynamicSize(.04)),
              child: Icon(_obscure?LineAwesomeIcons.eye_slash:LineAwesomeIcons.eye,
                  size: dynamicSize(.06),
                  color: Colors.grey),
            ),
          ) : null
      ),
    );
  }
}

