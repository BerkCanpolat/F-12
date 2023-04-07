import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f12/Screen/Not_Ekle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notlarım"),),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotEkle()));
        }, 
        label: Text("Not Ekle"),
        icon: Icon(Icons.add_box_outlined),
        ),
    );
  }
}