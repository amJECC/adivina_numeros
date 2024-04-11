import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numero_adivina/constants.dart';
import 'dart:math';

import 'package:numero_adivina/elements.dart';

class numerosPage extends StatefulWidget {

  final int limite;
  final int intentos;

  numerosPage({super.key, required this.limite, required this.intentos});

  @override
  _numerosPageState createState() => _numerosPageState(limite: limite, intentos: intentos);
}

class _numerosPageState extends State<numerosPage> {

  final TextEditingController numberController = TextEditingController();
  bool showUserError = false;


  final int limite;
  final int intentos;

  int numeroAleatorio = 0;
  
  int numerosIntroducidos = 0;

  bool igual = false;

  bool mayor = false;

  bool menor = false;

  bool showError = false;

  _numerosPageState({required this.limite, required this.intentos});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    generarNumeroAleatorio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.grey),
        ),
      ),
      body: Container(
          width: double.infinity,
          child: Column(
          children: [
            numerosIntroducidos >= intentos || igual ?
                  Text(" $numeroAleatorio",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                  color: igual ? Colors.blueAccent : Colors.pink))
                : Text("?",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,),),

            (numerosIntroducidos >= intentos && igual == false) ? Text("Lo siento, has perdido ): ",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,),) :
            Text(" ${mayor ? "El numero es  menor" : menor ? "El numero es  mayor": igual ? "FELICIDADES, HAS GANADO!" : ""}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,),),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 60,
                          child: TextField(
                            controller: numberController,
                            onChanged: onSearchTextChanged,
                            style: TextStyle(color: constans.principalColor),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 18),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: constans.principalColor,
                                        width: 2.0)),
                                hintText: "Numero",
                                hintStyle:
                                TextStyle(color: constans.principalColor),
                                prefixIcon: const Icon(Icons.numbers),
                                prefixIconColor: constans.principalColor),
                            keyboardType: TextInputType.number,  // Define el tipo de teclado
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,  // Acepta solo dígitos
                            ],
                          ),
                        ),
                        if (showError)
                          const Text(
                            'El numero no esta en el limite',
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),


                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: MaterialButton(
                          minWidth: 60,
                          height: 60,
                          onPressed: (){
                            if(!showError){
                              if(numberController.text.isNotEmpty){
                                (numerosIntroducidos < intentos || igual != true)?
                                verificarNumero(int.parse(numberController.text)) : true;
                              }
                            }
                          },
                          color: constans.principalColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(120),
                          ),
                          child: Container(
                            width: 20.0,
                            height: 60.0,
                            alignment: Alignment.center,
                            child: const Icon(Icons.send,
                                color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${index + 1}'),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('${index + 1}'),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void generarNumeroAleatorio() {
    Random random = Random();
    numeroAleatorio = random.nextInt(limite) + 1;
  }

  void onSearchTextChanged(String numeroIntroducido) {

    if(numeroIntroducido.isNotEmpty) {
      int numero = int.parse(numeroIntroducido);
      if (numero > limite || numero < 1) {
        setState(() {
          showError = true;
        });
      } else {
        setState(() {
          showError = false;
        });
      }
    }
  }

  void verificarNumero(int numero){

    setState(() {
      numerosIntroducidos++;
    });

    if(numero == numeroAleatorio){
      setState(() {
        igual = true;
        menor = false;
        mayor = false;
      });
    }else if(numero < numeroAleatorio){
      setState(() {
        menor = true;
        igual = false;
        mayor = false;
      });
    }else if(numero > numeroAleatorio){
      setState(() {
        mayor = true;
        igual = false;
        menor = false;
      });
    }
  }


}


