import 'package:flutter/material.dart';

void main() => runApp(MyApp());
 

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

  class MyAppState extends State<MyApp>{

    double _numberForm=0;
    String? _resultMessage;

    final Map<String, int> _measuresMap = {
      'meters' : 0,
      'kilometer' : 1,
      'grams' : 2,
      'kilograms' : 3,
      'feet' : 4,
      'miles' : 5,
      'pounds()lbs' : 6,
      'ounces' : 7,
    };

    final List<String> _measures = [
      'meters',
      'kilometer' ,
      'grams' ,
      'kilograms' ,
      'feet' ,
      'miles',
      'pounds()lbs',
      'ounces' ,
    ];

    

    


    final dynamic _formulas = { '0':[1,0.001,0,0,3.28084,0.000621371,0,0],
    '1':[1000,1,0,0,3280.84,0.621371,0,0],
    '2':[0,0,1,0.0001,0,0,0.00220462,0.035274],
    '3':[0,0,1000,1,0,0,2.20462,35.274],
    '4':[0.3048,0.0003048,0,0,1,0.000189394,0,0],
    '5':[1609.34, 1.60934,0,0,5280,1,0,0],
    '6':[0,0,453.592,0.453592,0,0,1,16],
    '7':[0,0,28.3495,0.0283495,3.28084,0,0.0625, 1],
    };

  String? _startMeasure;
  String? _convertedMeasure;

    @override
    void initState() {
      _numberForm = 0; super.initState();
    }

    void convert(double value, String from, String to) { 
    var From = _measuresMap[From];
    var To = _measuresMap[To];
    var multiplier = _formulas[From.toString()][To]; var result = value * multiplier;
    }

    


  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
    fontSize:  20,
    color: Colors.blue[900],
    );
  
    final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700]
    );
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measure Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                SizedBox(height: 10),

                SizedBox(height: 20),
                Text(
                  'From',
                  style: labelStyle,
                ),
              DropdownButton<String>(
                isExpanded: true,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                     child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState((){
                    _startMeasure = value;
                    });
                  },value: _startMeasure,
              ),
              SizedBox(height: 20),
                Text(
                  'To',
                  style: labelStyle,
                ),
              DropdownButton<String>(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                     child: Text(value, style: inputStyle),
                  );
                }).toList(),
                onChanged: (value) {
                  setState((){
                    _convertedMeasure = value;
                    });
                  },value: _convertedMeasure,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                child: Text('Convert', style: inputStyle),
                onPressed: () {
                  if (_startMeasure.isEmpty  || _convertedMeasure.isEmpty  || 
                  _numberForm==0){
                    return;
                  }
                  else {
                    convert(_numberForm, _startMeasure, _convertedMeasure);
                  }
                },
              ),

              SizedBox(height: 20),
              Text(
              (_numberFrom == null) ? '' : _numberFrom.toString(),
              style: labelStyle,
              textAlign: TextAlign.center,
              ),

              
              
              
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: "Please insert the measure to be converted",
                ),
                onChanged: (text){
                  var rv = double.tryParse(text);
                  if (rv != null){
                    setState(() {
                      _numberForm = rv;
                      });
                    }
                  },
                ), Text ((_numberForm == null) ? "" : _numberForm.toString())
              ], 
            ),
          ),
        ),
      ),
    );
  }
}