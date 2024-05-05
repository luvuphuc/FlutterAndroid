import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/widget/wrapper_data.dart';

class MyRadioButton extends StatefulWidget {
  StringWrapper groupValue;
  List<String> labels;
  bool? isHorizoltal;


  MyRadioButton({required this.groupValue,required this.labels, this.isHorizoltal = true,super.key});

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  @override
  Widget build(BuildContext context) {
    if(widget.isHorizoltal ==true)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildratio(),
      );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildratio(),
    );
  }
  _buildratio(){
    return widget.labels.map(
            (label) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
                value: label,
                groupValue: widget.groupValue.value,
                onChanged: (value){
                  setState(() {
                    widget.groupValue.value = value;
                  });
                }
            ),
            Text(label)
          ],
        )).toList();
  }
}
