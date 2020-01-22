
import 'dart:ffi';


import 'package:flutter/material.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  double _total = 0.0;
  double _total2 = 0.0;
  double _total3 = 0.0;
  double _totalAll = 0.0;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Sharing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: ['1']
                .map((e) => Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Price'
                        ),
                        onChanged: (val){
                          setState(() {
                            _total = double.parse(val);
                            print(_total);
                          });
                        },
                        keyboardType: TextInputType.number,

                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'People'
                        ),
                        onChanged: (val){
                          setState(() {
                            _total2 = double.parse(val);
                            print(_total);
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Amount'
                          ),
                          onChanged: (val){
                            setState(() {
                              _total3 = double.parse(val);
                              print(_total);
                            });
                          },
                          keyboardType: TextInputType.number,
                        )                    )
                  ],
                )
            ))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          setState(() {
            _totalAll = _total3 - (_total2 * _total);
            print(_total);
          });
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('Need to have ' + _totalAll.toString() + 'LE'),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
