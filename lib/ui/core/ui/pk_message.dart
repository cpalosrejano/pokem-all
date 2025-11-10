
import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/themes/colors.dart';
import 'package:pokem_all/ui/core/ui/pk_text.dart';

class PkMessage extends StatelessWidget {

  final String message;
  final ImageProvider? avatar;
  final Widget? child;
  final bool inverse;

  const PkMessage(this.message, {super.key, this.avatar, this.child, this.inverse = false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (inverse) {
      return messageItemInverse(message, isDark);
    } else {
      return messageItem(message, isDark);
    }
    
  }

    Widget messageItem(String message, bool isDark) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(avatar != null)
        CircleAvatar(
          radius: 24,
          backgroundColor: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background, 
          child: CircleAvatar(
            radius: 20,
            foregroundImage: avatar, 
            backgroundColor: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background, 
          ),
        ),

        SizedBox(width: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero, 
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24), 
              ),
              border: BoxBorder.all(
                color:PkColors.mb_border, 
                width: 2
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if (message.isNotEmpty)
                      PkText(message),

                    if (child != null && message.isNotEmpty)
                      SizedBox(height: 8),

                    child ?? Container(),
                    
                  ],
                ),
            ),
          ),
        ),
      ]
    );
  }

  Widget messageItemInverse(String message, bool isDark) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), 
                topRight: Radius.zero,
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24), 
              ),
              border: BoxBorder.all(
                color:PkColors.mb_border, 
                width: 2
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    if(message.isNotEmpty)
                      PkText(message),

                    if (child != null && message.isNotEmpty)
                      SizedBox(height: 8),

                    child ?? Container(),
                    
                  ],
                ),
            ),
          ),
        ),

        SizedBox(width: 8),

        if(avatar != null)
          CircleAvatar(
          radius: 24,
          backgroundColor: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background, 
          child: CircleAvatar(
            radius: 20,
            foregroundImage: avatar, 
            backgroundColor: (isDark) ? PkColors.mb_dark_background : PkColors.mb_background, 
          ),
        ),
      ]
    );
  }

}