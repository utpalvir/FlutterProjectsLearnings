import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kLocalTimeStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  helperText: null, // Remove the default helperText
  helper: Align(
    alignment: Alignment.center,
    child: Text(
      'Enter City Name',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  ),
  hintText: 'City Name..',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 5.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
