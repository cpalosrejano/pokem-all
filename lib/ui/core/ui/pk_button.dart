import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/themes/colors.dart';

class PkButton extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final PkButtonType buttonType;
  
  const PkButton(this.text, {super.key, this.onPressed, this.buttonType = PkButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonType._getStyle(),
      onPressed: onPressed, 
      child: Text(
        text.toUpperCase(), 
        style: buttonType._getTextStyle()
      )
    );
  }
}

enum PkButtonType {
  primary, secondary;

  ButtonStyle _getStyle() {
    if (this == PkButtonType.primary) { 
      return _getPrimaryButtonStyle(); 
    } else { 
      return _getSecondaryButtonStyle();
    }
  }

  TextStyle _getTextStyle() {
      return TextStyle(
        fontWeight: FontWeight.bold, 
        color: PkColors.border,
        letterSpacing: 0.5
      ); 
  }

}

ButtonStyle _getPrimaryButtonStyle() {

  return ButtonStyle(
    
    minimumSize: WidgetStateProperty.all(const Size.fromHeight(56)),
    
    backgroundColor:  WidgetStateProperty.resolveWith<Color>((states) {
      return states.contains(WidgetState.disabled)
        ? PkColors.disabled
        : PkColors.primary;
    }),

    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: PkColors.border, width: 2),
      )
    ),
    
  );
}

ButtonStyle _getSecondaryButtonStyle() {
  return ButtonStyle(

    minimumSize: WidgetStateProperty.all(const Size.fromHeight(56)),
    
    backgroundColor:  WidgetStateProperty.resolveWith<Color>((states) {
      return states.contains(WidgetState.disabled)
        ? PkColors.disabled
        : PkColors.secondary;
    }),

    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: PkColors.border, width: 2),
      )
    ),
    
  );
}

  

