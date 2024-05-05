import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/widget/wrapper_data.dart';

class MyDropDownButton extends StatefulWidget {
  StringWrapper value;
  List<String> labels;
  Widget Function(String label)? buildItem;
  MyDropDownButton({required this.value,required this.labels,this.buildItem,super.key});
  //const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: widget.value.value,
        items: widget.labels.map(
                (label) => DropdownMenuItem(
                  child: widget.buildItem == null? Text(label) : widget.buildItem!(label),
                  value: label,
                )
        ).toList(),
        onChanged: (value){
          setState(() {
            widget.value.value = value;
          });
        }
    );
  }
}
