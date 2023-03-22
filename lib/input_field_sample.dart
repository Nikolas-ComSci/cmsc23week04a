import 'package:flutter/material.dart';

class InputFieldsSample extends StatefulWidget {
  InputFieldsSample({super.key});

  @override
  _InputFieldsSampleState createState() => _InputFieldsSampleState();
}

class _InputFieldsSampleState extends State<InputFieldsSample> {
  String _searchTerm = "";
  bool _isChecked = false;

  static final List<String> _dropdownOptions = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ];
  String dropdownValue = _dropdownOptions.first;




  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      print("Latest Value: ${_searchController.text}");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  //  para ma free up ung memory na gamit ng controller pag wala na sa screen

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // using onChanged
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter string",
              labelText: "Using onChanged",
            ),
            onChanged: (String value) {
              _searchTerm = value;
              print(_searchTerm);
            },
          ),
        ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(_searchTerm),
                  );
                },
              );
            },
            child: const Text('Show text'),
          ),

        // text field using controller
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter string",
                labelText: "Using Controller"),
            controller: _searchController,
          ),
        ),
        

        Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!; // exclamation point means finoforce natin ito, hindi sya null
                  print(_isChecked);
                });
              },
              
            ),


        DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: _dropdownOptions.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),



        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                      "onChanged: $_searchTerm \nController: ${_searchController.text} \nCheckbox: $_isChecked \ndropdown value: $dropdownValue"),
                );
              },
            );
          },
          child: const Text('Show text'),
        ),

      ],
    );
  }
}

