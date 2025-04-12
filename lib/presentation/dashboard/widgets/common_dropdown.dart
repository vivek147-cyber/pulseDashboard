import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CommonDropdown extends StatefulWidget {
  final String textFieldName;
  final String labelTextName;
  final bool isFullLength;
  final List<String> list;
  String status;
  String remarks;
  String? errorMessage;
    bool isAlreadyFilled;
    bool? height;

  final ValueChanged<String?> onChanged;

  CommonDropdown({
    required this.textFieldName,
    required this.labelTextName,
    required this.isFullLength,
    required this.list,
    required this.onChanged,
     required this.status,
    required this.remarks,
    required this.errorMessage,
    required this.isAlreadyFilled,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {

    bool checkError = false;

  @override
  void initState() {
    super.initState();

    

    checkError =  widget.errorMessage != null ||  widget.status == 'Rejected' ? true : false ;
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     
      Container(
          decoration: BoxDecoration(
               border: Border.all(
              width: 0.5,
              color: checkError ? Colors.red :  widget.isAlreadyFilled ?Colors.transparent:
                   Colors.white
                  ,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color:  const Color.fromARGB(255, 217, 231, 255),
          
          ),
          child:  widget.isAlreadyFilled ? TextFormField(
            cursorColor: Colors.black,
          
            initialValue: widget.isAlreadyFilled ? widget.labelTextName : null,
            readOnly: widget.isAlreadyFilled,
        
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '', // Hides the counter text
              suffixIcon: GestureDetector(
                onTap: () {
                  if (widget.isAlreadyFilled) return;
                 
                },
                child: SizedBox.shrink(),
              ),
            
              prefixStyle: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.bold
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: widget.isAlreadyFilled ? '' : widget.labelTextName,
              labelStyle: TextStyle(
                color:  Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.transparent,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.solid,
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
            ),
          ): CustomDropdown<String>(
            hintText: widget.labelTextName,
            items: widget.list,
            decoration: CustomDropdownDecoration(
              expandedSuffixIcon: Icon(Icons.arrow_drop_up, color:  Colors.black,),
              closedSuffixIcon: Icon(Icons.arrow_drop_down, color:  Colors.black,),
              closedFillColor: const Color.fromARGB(255, 217, 231, 255),
              expandedFillColor: const Color.fromARGB(255, 217, 231, 255),
              headerStyle: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w600
              ),
              listItemStyle: TextStyle(
                color:  Colors.black
              )
            ),
            
            onChanged:  widget.isAlreadyFilled ? null: (value) {
              log('Changing value to: $value');
              if (value != null) {
                widget.onChanged(value); 
              }
            },
          ),
        ),
      ],
    );
  }
}
