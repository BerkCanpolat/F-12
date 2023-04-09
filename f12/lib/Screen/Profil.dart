import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ProfilNotlari()),
        ],
      )
    );
  }
}



class ProfilNotlari extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<ProfilNotlari> {

  var favoriteUser = false;
  int index = 0;

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Notlar').where('kullaniciID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey[300],
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: ListTile(
                    title: data['kullanici_baslik'] == null ? const Text("Başlık Yok") : Text(data['kullanici_baslik'],style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: data['kullanici_icerik'] == null ? const Text("İçerik Yok") : Text(data['kullanici_icerik']),
                    leading:favoriteUser ? IconButton(onPressed: (){
                      setState(() {
                        favoriteUser = false;
                      });
                    }, icon: Icon(Icons.favorite,color: Colors.red,)) : IconButton(onPressed: (){
                      setState(() {
                        favoriteUser = true;
                      });
                    }, icon: Icon(Icons.favorite)),
                      trailing:data['resim'] == null ? ClipRRect(child: Image.asset("assets/default.png",fit: BoxFit.cover,)) : CircleAvatar(child: Image.network("${data['resim']}",width: 100,height: 100,fit: BoxFit.cover,)),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}