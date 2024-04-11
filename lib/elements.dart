import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numero_adivina/Game/numeroGame.dart';

// ------------ Metodo para mostrar el Dialog de carga entre pantallas --------------

void showLoadingDialog(BuildContext context) {
  showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return const SimpleDialog(
            //backgroundColor: Colors.white,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child:
                        SpinKitPouringHourGlass(
                          size: 50,
                          color: Color.fromARGB(255,39,66,150),
                          duration: Duration(milliseconds: 700),
                        )
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('Loading',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255,39,66,150),
                                fontWeight: FontWeight.bold)))
                  ])
            ],
          );
        });
      });
}

// ----------------------------------------------------------------------------------

// -------------------- Metodo para mostrar el Toast --------------------------------

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      webPosition: "center",
      fontSize: 16.0);
}

void showWarningDialog(BuildContext context, String warningText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Warning'),
        content: Text(warningText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

// ----------------------------------------------------------------------------------

// ----------------------- Estilo de las Cards del menu -----------------------------

Widget menuCard({title,subtitle,icon,context,color,limite,intentos}){
  return InkWell(
    onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => numerosPage(limite: limite, intentos: intentos)));
      
    },
    highlightColor: Colors.black.withOpacity(0.1),
    child :  Card(
      color: color,
      child: Padding(
        padding:   const EdgeInsets.symmetric(horizontal:20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 35,color: Colors.white
                    )),
                Text(subtitle,
                  style: const TextStyle(fontSize: 18,color: Colors.white),)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                icon
              ],
            )
          ],
        ),
      ),
    ),
  );
}

// ----------------------------------------------------------------------------------

// --------------------------Entradas para formulario -------------------------------

Widget makeInput({label, obscureText = false, controller, showError,iconTextField,color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      Text(
        label,
        style: const TextStyle(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black54),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            suffixIcon: iconTextField,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: color)),
            border: OutlineInputBorder(
                borderSide:
                BorderSide(color: color))),
      ),
      // Agregar un espacio para el mensaje de error
      const SizedBox(height: 1),
      // Mostrar mensaje de error debajo del TextField solo cuando sea necesario
      if (showError)
        const Text(
          'Debes de ingresar este dato',
          style: TextStyle(color: Colors.red),
        ),
    ],
  );
}

// ----------------------------------------------------------------------------------
