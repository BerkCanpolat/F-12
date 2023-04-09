import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class NotEkle extends StatefulWidget {
  const NotEkle({super.key});

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {
  TextEditingController baslikT = TextEditingController();
  TextEditingController icerikT = TextEditingController();

  File? genelDosya;
  String? indirmeBaglantisi;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> noteAdds() async {
    await FirebaseFirestore.instance
    .collection("Notlar")
    .doc(baslikT.text)
    .set({'kullaniciID' : auth.currentUser?.uid,'kullanici_baslik' : baslikT.text, 'kullanici_icerik' : icerikT.text, 'resim' : indirmeBaglantisi})
    .then((value){
      final value = ConnectionState.done;
      if (value == ConnectionState.done) {
        createSuccesNoteAdd("Not Başarıyle Eklendi!");
      } else if (value == ConnectionState.waiting) {
        Center(child: CircularProgressIndicator());
      }
    });
  }

  kameradanYukle() async{
    var yuklenecekDosya = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      genelDosya = File(yuklenecekDosya!.path);
    });

    Reference referansYolu = FirebaseStorage.instance
    .ref()
    .child("notkullaniciresimleri")
    .child(auth.currentUser!.uid)
    .child("profilresmi");

    UploadTask yuklemeGorevi = referansYolu.putFile(genelDosya!);
    String url = await (await yuklemeGorevi.whenComplete(() => print("Fotoğraf Yüklendi!"))).ref.getDownloadURL();
    setState(() {
      indirmeBaglantisi = url;
    });
  }

  void createSuccesNoteAdd(String messsage) {
    final snackBar = SnackBar(
      content: Text(
        messsage,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notlarım"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            controller: baslikT,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintText: "Başlık",
              hintStyle: TextStyle(
                fontSize: 35,
                color: Colors.grey,
              ),
            ),
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: icerikT,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintText: "Yazmaya başla",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            minLines: 20,
            maxLines: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: noteAdds,
                child: Text("Ekle"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50), primary: Colors.deepPurple),
              ),
              ElevatedButton(
                onPressed: kameradanYukle, 
                child: Text("Resim Yükle"),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("İptal"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 50),
                    primary: Colors.deepPurple[800]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
