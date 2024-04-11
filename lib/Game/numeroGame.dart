import 'package:flutter/material.dart';

class numerosPage extends StatefulWidget {

  final int limite;
  final int intentos;

  numerosPage({super.key, required this.limite, required this.intentos});

  @override
  _numerosPageState createState() => _numerosPageState(limite: limite, intentos: intentos);
}

class _numerosPageState extends State<numerosPage> {
  final TextEditingController userController = TextEditingController();

  final int limite;
  final int intentos;

  _numerosPageState({required this.limite, required this.intentos});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


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
        child: Column(
          children: [
            Text()
          ],
        ),
      ),
    );
  }

}


