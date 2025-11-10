import 'dart:ui';

import 'package:flutter/material.dart';

class PkImageBackground extends StatelessWidget {

  final ImageProvider background;
  final double blur;

  const PkImageBackground({super.key, required this.background, this.blur = 10});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: background,
            fit: BoxFit.cover,
          ),
        ),
        
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              color: (isDarkMode)
              ? Colors.black.withAlpha(155)
              : Colors.black.withAlpha(0)
            ),
          ),
        ),
      ],
    );
  }
}