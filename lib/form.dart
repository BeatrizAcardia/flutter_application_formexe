// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Meuform extends StatefulWidget {
  const Meuform({super.key});

  @override
  State<Meuform> createState() => _MeuformState();
}

class _MeuformState extends State<Meuform> {
  @override

  GlobalKey<FormState> chaveValida = GlobalKey();
  TextEditingController raController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("๋࣭ ⭑⚝Exemplo formulário๋࣭ ⭑⚝", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green[400],
        ),

        body: SingleChildScrollView(
          child: Form(
            key: chaveValida,
            child: Column( children: [
                TextFormField(
                  controller: raController,
                  decoration: InputDecoration(labelText: "RA: "), 
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Preencha o campo!";
                    }
                     else{
                      if(int.parse(raController.text)<10){
                        return "O RA deve ser maior que 10!";
                      }
                    }
                    return null;
                  },
                  
                ),

                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome: "),
                  validator: (value) {
                    if(value!.isEmpty){ //o ponto de exclamação serve pra setar valor nulo
                      return "Preencha o campo!";
                    }
                    else{
                        if (value.length<3){
                          return "Digite um nome com pelo menos 3 caracteres!";
                        }
                      }
                      return null;
                  },
                ),

              SizedBox(height: 30,),

                ElevatedButton(onPressed: () {
                  if (chaveValida.currentState!.validate()){
                   print (nomeController.text + " " + raController.text.toString());
                  }
                  setState(() {
                    
                  });
                }, child: Text("Enviar")),
        ]),
        )),
    );
  }
}