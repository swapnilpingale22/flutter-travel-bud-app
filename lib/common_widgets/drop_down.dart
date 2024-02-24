import 'package:flutter/material.dart';

class StateDropdown extends StatefulWidget {
  final String selectedState;
  final List<String> statesList;
  final Function(String?)? onPressed;
  const StateDropdown({
    super.key,
    required this.selectedState,
    required this.statesList,
    required this.onPressed,
  });

  @override
  StateDropdownState createState() => StateDropdownState();
}

class StateDropdownState extends State<StateDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: widget.selectedState,
      hint: const Text(
        'Select your state',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
      onChanged: widget.onPressed,
      items: widget.statesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
