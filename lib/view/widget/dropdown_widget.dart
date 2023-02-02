import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

 List? accountType;
   DropdownWidget({Key? key, required this.accountType}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  

 

  String? selectedType;

  get accountType => null;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0),

      child:  DropdownButton(
        items: accountType
            .map((value) => DropdownMenuItem(
          child: Text(
            value,
            style: TextStyle(color: Color(0xff11b719)),
          ),
          value: value,
        ))
            .toList(),
        onChanged: (selectedType) {
          print('$selectedType');
          setState(() {
            selectedType = selectedType;
          });
        },
        value: selectedType,
        isExpanded: false,

        hint: Text(
          'Choose Account Type',
          style: TextStyle(color: Color(0xff11b719)),
        ),
      ),




      );
  }
}
