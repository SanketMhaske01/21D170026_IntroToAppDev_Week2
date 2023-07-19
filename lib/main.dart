


import 'package:flutter/material.dart';
import 'package:expense_app/pages/home.dart';
import 'package:expense_app/pages/expense screen.dart';


void main() {
  runApp(MaterialApp(
  initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/expense screen': (context) => expense(),


    },

  ));
}

