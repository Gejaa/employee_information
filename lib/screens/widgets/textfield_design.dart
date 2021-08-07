import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldDesign extends StatelessWidget {
  final usercontroller,
      onChanged,
      sufficIcon,
      hintText,
      focusNode,
      prefixIcon,
      Type,
      validator,obsecure;

  TextFieldDesign({
    Key key,  @required this.usercontroller,
    this.Type,
    @required this.onChanged, this.obsecure,
    this.prefixIcon,
    @required this.validator,
    @required this.sufficIcon,
    @required this.hintText,
    @required this.focusNode,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return TextFormField(
        controller: usercontroller,
        focusNode:focusNode,
        validator:validator ,
        onChanged: onChanged,
        obscureText: obsecure??false,style: GoogleFonts
        .roboto( color: Colors.black,fontSize: 15),
        scrollPadding: EdgeInsets.only(left: 75),
        keyboardType: Type??TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 15,),
            hintText: hintText,
            hintStyle:GoogleFonts
                .roboto(color: Colors.black54,fontSize: 15),
            filled: true,
            suffixIcon: sufficIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black))
        ));
  }
}