import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:numero_adivina/elements.dart';


class dificultyGamePage extends StatelessWidget{

  final String usuario;

  dificultyGamePage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context){
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                FadeInUp(
                  child: Text(textAlign: TextAlign.center,
                    "Hola ${usuario} ¿Que tan bueno(a) te consideras?!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: menuCard(title: "Facil", subtitle: "Para todos",icon: Icon(Icons.east),context: context,color: Colors.teal,limite: 10,intentos: 5),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: menuCard(title: "Medio", subtitle: "Para todos",icon: Icon(Icons.east),context: context,color: Colors.amber,limite: 20,intentos: 8),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: menuCard(title: "Avanzado", subtitle: "Para todos",icon: Icon(Icons.east),context: context,color: Colors.deepOrange,limite: 100,intentos: 15),
                  ),
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: menuCard(title: "Extremo", subtitle: "Para todos",icon: Icon(Icons.east),context: context,color: Colors.redAccent,limite: 1000,intentos: 25),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }



}