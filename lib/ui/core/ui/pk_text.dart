import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/themes/colors.dart';

class PkText extends StatelessWidget {

  final PkTextColor color;
  final PkTextType type;
  final String text;

  const PkText(this.text, {super.key, this.color = PkTextColor.black, this.type = PkTextType.body});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      style: type._getTextStyle(
        color._getTextColor(isDark)
      ),
    );
  }
}

enum PkTextColor {
  black, gray, primary;

  Color _getTextColor(bool isDark) {    
    if (this == primary) {
      return PkColors.tx_text_primary;
    } else if (this == gray) {
      return PkColors.tx_text_alt;
    } else {
      return (isDark) ? PkColors.tx_dark_text : PkColors.tx_text;
    }
  }
}

enum PkTextType {
  headline, title, subtitle, body, tip;

  TextStyle _getTextStyle(Color color) {
      double fontSize = (this == headline) ? 36
        : (this == title) ? 28
        : (this == subtitle) ? 20
        : (this == body) ? 16
        : (this == tip) ? 14
        : 16;

      FontWeight fontWeight = (this == headline) ? FontWeight.w900
        : (this == title) ? FontWeight.bold
        : (this == subtitle) ? FontWeight.w500
        : (this == body) ? FontWeight.normal
        : (this == tip) ? FontWeight.normal
        : FontWeight.normal;

      
      double letterSpacing = (this == headline) ? 1.8
        : (this == title) ? 2
        : 0;

      return TextStyle(
        fontWeight: fontWeight, 
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ); 
  }
}