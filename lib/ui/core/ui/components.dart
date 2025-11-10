import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/ui/pk_button.dart';
import 'package:pokem_all/ui/core/ui/pk_chooser.dart';
import 'package:pokem_all/ui/core/ui/pk_input.dart';
import 'package:pokem_all/ui/core/ui/pk_message.dart';
import 'package:pokem_all/ui/core/ui/pk_text.dart';

class ComponentsDemo extends StatelessWidget {
  const ComponentsDemo({super.key});

  @override
  Widget build(BuildContext context) {

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        
        Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: (isDarkMode)
              ? Colors.black.withAlpha(155)
              : Colors.black.withAlpha(0)
            ),
          ),
        ),

        SafeArea(
          top: true,
          bottom: true,
          child: _content()
        )
      ],
    );
  }

  Widget _content() {
    List<NetworkImage> starters = [
      NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
      NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png"),
      NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),

            PkMessage("Es peligroso ir ahí afuera solo. Elige tu primer compañero de aventuras",
              avatar: AssetImage("assets/images/oak.png"),
              child: PkChooser(
                options: starters,
                onOptionSelected: (index) {
                  print("Se ha seleccionado $index");
                },
              ),  
            ),
            SizedBox(height: 32),

            

            PkChooser(
              options: starters,
              onOptionSelected: (index) {
                print("Se ha seleccionado $index");
              },
            ),
            SizedBox(height: 32),

            PkMessage("Bienvenido al mundo de Pokem",
              avatar: NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png"),
            ),
            SizedBox(height: 8),

            PkMessage("Este es un mundo lleno de criaturas misteriosas y curiosas. Como tu, que has llegado hasta aquí para desafiar las leyes de la física",
              avatar: AssetImage("assets/images/oak.png"),
              child: PkInput(
                hint: "Ash Ketchum",
              ),  
            ),
            SizedBox(height: 32),
        
            PkText("Headline text", type: PkTextType.headline),
            SizedBox(height: 8), 
        
            PkText("Title text", type: PkTextType.title, color: PkTextColor.gray,),
            SizedBox(height: 8), 
        
            PkText("Subtitle text", type: PkTextType.subtitle),
            SizedBox(height: 8), 

            PkText("Body text"),
            SizedBox(height: 8), 
        
            PkText("Tip text", type: PkTextType.tip, color: PkTextColor.primary,),
            SizedBox(height: 32), 
        
            PkInput(onSubmitted: (text) => print("submit $text"), inputAction: TextInputAction.next,),
            SizedBox(height: 8, ),
            
            PkInput(hint: "Input with hint", onSubmitted: (text) => print("submit $text"), inputAction: TextInputAction.next,),
            SizedBox(height: 8),
        
            PkInput(text: "Value", onSubmitted: (text) => print("submit $text"), inputAction: TextInputAction.done),
            SizedBox(height: 32),
        
            PkButton("Primary PkButton", onPressed: () {}),
            SizedBox(height: 8),
        
            PkButton("Secondary PkButton", buttonType: PkButtonType.secondary, onPressed: () {}),
            SizedBox(height: 8),
        
            PkButton("Disabled PkButton", buttonType: PkButtonType.secondary),
            SizedBox(height: 32),

        
          ],
        ),
        ]
      ),
    );
  }

}