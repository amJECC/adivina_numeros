import 'package:flutter/material.dart';
import 'package:numero_adivina/Home/HomePage.dart';
import 'dart:async';

import 'package:numero_adivina/constants.dart';


class PrincipalPage extends StatefulWidget{
  const PrincipalPage({super.key});

  @override
  PrincipalPageState createState() => PrincipalPageState();
}

class PrincipalPageState extends State<PrincipalPage> {
  int activeIndex = 0;
  final List<String> _imagenes = ['assets/logo.png',
    'assets/logo2.png' ];

  @override
  void initState(){
    super.initState();

    startTimer();
  }

  startTimer(){
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        activeIndex++;

        if(activeIndex  == 2){
          activeIndex = 0;
        }
      });
    });
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Bienvenido!", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),),
                  SizedBox(height: 15,),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 250,
                      child: Stack(
                        children :  _imagenes.asMap().entries.map((e) {
                          return Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 500),
                                  opacity: activeIndex == e.key ?  1 : 0,
                                  child: Image.asset(e.value, height: 400,)
                              )
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    color: constans.principalColor,
                    shape: RoundedRectangleBorder(
                        side:  const BorderSide(
                            color: Colors.transparent
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:  const Text("Ingresar",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600, fontSize: 18
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}