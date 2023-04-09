import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f12/Screen/Tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/src/widgets/placeholder.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {

  var _formKey = GlobalKey<FormState>();

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();



  Future<void> kayitOl() async{
    await FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
    .then((value){
      FirebaseFirestore.instance
      .collection("Kullanicilar")
      .doc(t1.text)
      .set({'kullaniciEposta' : t1.text, 'kullaniciSifre' : t2.text}).whenComplete(() => print("Kullanıcı kayıt oldu"));
    });
  }


  Future<void> girisYap() async{
    FirebaseAuth.instance
    .signInWithEmailAndPassword(email: t1.text, password: t2.text)
    .then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabbarPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/default.png",width: 70,),
          SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                    controller: t1,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "E-Posta Adresi",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "E-Posta Boş Bırakılamaz!";
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: t2,
                    obscureText: true,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Şifre Boş Bırakılamaz!";
                      }else if(value.length < 4){
                        return "Şifreniz 4 karakterden kısa olamaz!";
                      }
                    },
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        girisYap();
                      }
                    }, child: Text("Giriş Yap")
                    )
                    ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(onPressed: kayitOl, child: Text("Kaydol"),
                    ),
                    ),
                    SizedBox(height: 15,),
                    Divider(
                      height: 0,
                      indent: 0,
                      thickness: 1,
                      color: Colors.black,
                      ),
                    TextButton(onPressed: (){}, child: Text("Şifremi Unuttum")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}