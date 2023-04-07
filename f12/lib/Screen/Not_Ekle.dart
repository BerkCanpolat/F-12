import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotEkle extends StatefulWidget {
  const NotEkle({super.key});

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {

  TextEditingController baslikT = TextEditingController();
  TextEditingController icerikT = TextEditingController();


  noteAdds(){
    FirebaseFirestore.instance
    .collection("Notlar")
    .doc(baslikT.text)
    .set({'kullanici_baslik' : baslikT.text, 'kullanici_icerik' : icerikT.text});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notlarım"),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children:  [
              TextField(
                controller: baslikT,
                decoration: const InputDecoration(
                  hintText: "Başlık",
                  hintStyle: TextStyle(
                    fontSize: 35,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              TextField(
                controller: icerikT,
                decoration: const InputDecoration(
                  hintText: "Yazmaya başla",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                minLines: 30,
                maxLines: 30,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: noteAdds, child: Text("Ekle")),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: const Text("İptal")),
                ],
              )
        ],
      ),
    );
  }
}