import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:numero_adivina/Home/elements.dart';
import 'package:numero_adivina/constants.dart';



class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController userController = TextEditingController();

  bool showUserError = false;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                FadeInUp(
                  child: Text(
                    "Adivina el número",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                  child: Text(
                    "Ingresa tu nombre :).",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: <Widget>[
                  FadeInUp(
                    child: makeInput(
                        label: "Nombre",
                        controller: userController,
                        showError: showUserError,
                        color: constans.principalColor
                  ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Column(
                children: <Widget>[
                  FadeInUp(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        setState(() {
                          showUserError = userController.text.isEmpty;
                        });
                        if (!showUserError) {
                          print("Hola Jair");
                        }
                      },
                      color: constans.principalColor,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Continuar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/ilustracion.png'),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


