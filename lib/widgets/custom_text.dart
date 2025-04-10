import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    this.align = TextAlign.center,
    this.textStyle,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign align;
  final TextStyle? textStyle; // Make it nullable

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style:
          textStyle ??
          GoogleFonts.poppins(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
