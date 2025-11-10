import 'package:flutter/material.dart';
import 'package:pokem_all/ui/core/themes/colors.dart';

class PkChooser extends StatefulWidget {

  final List<ImageProvider> options;
  final Function(int index) onOptionSelected;
  final double? height;

  const PkChooser({super.key, required this.options, required this.onOptionSelected, this.height});

  @override
  State<PkChooser> createState() => _PkChooserState();
}

class _PkChooserState extends State<PkChooser> {

  var itemSelected = -1;

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    if(height != null) {
      return SizedBox(height: height, child: _chooser());
    } else {
      return _chooser();
    }
  }

  Widget _chooser() {
    List<ImageProvider> items = widget.options;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        for(var index = 0; index < items.length; index++)
          _chooserItemView(
            content : items[index], 
            isSelected : (itemSelected == index), 
            onTap: () {
              setState(() {
                itemSelected = index;
                widget.onOptionSelected(index);
              });
            }
          ),

      ],
    );
  }

}



Widget _chooserItemView({required ImageProvider content, required bool isSelected, required Function onTap}) {

  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          onTap.call();
        },
        child: Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(
              color: (isSelected) ? PkColors.primary : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Image(image: content),
          )
          )
        ),
      ),
    ),
  );

}