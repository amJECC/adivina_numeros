import 'package:flutter/material.dart';
import 'package:numero_adivina/Home/PrincipalPage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalPage(),
    ),
  );
}
