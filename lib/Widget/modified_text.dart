import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ModifiedText extends StatelessWidget {
  final String ?text;
  final Color? color;
  final double? size;
  final int? year;
  const ModifiedText({Key? key, this.text, this.color, this.size, this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,style: GoogleFonts.breeSerif(
      color: color, fontSize: size,

    ), );
  }
}
