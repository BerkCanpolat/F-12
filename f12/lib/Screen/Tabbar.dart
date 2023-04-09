import 'package:f12/Login/Login.dart';
import 'package:f12/Screen/Anasayfa.dart';
import 'package:f12/Screen/Ayarlar.dart';
import 'package:f12/Screen/Profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notlarım"),
          actions: [
            IconButton(
              onPressed: (){
                FirebaseAuth.instance
                .signOut()
                .then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Giris()));
                });
              }, 
              icon: Icon(Icons.exit_to_app)
              )
          ],
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              tabs: [
            Tab(text: "Anasayfa",),
            Tab(text: "Profil",),
            Tab(text: "Ayarlar",),
          ]),
            Expanded(
              child: TabBarView(
                children: [
                  Anasayfa(),
                  ProfilEkrani(),
                  Ayarlar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}