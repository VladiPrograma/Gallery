import 'package:flutter/material.dart';
import '../config/global_variables.dart';

void ShowSnackBar(){
  snackbarKey.currentState?.showSnackBar( const SnackBar(
      padding: EdgeInsets.zero,
      content: Text("Snack Example")
  ));
}

