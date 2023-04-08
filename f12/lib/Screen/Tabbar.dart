import 'package:f12/Screen/Anasayfa.dart';
import 'package:f12/Screen/Ayarlar.dart';
import 'package:f12/Screen/Profil.dart';
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
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.red,
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