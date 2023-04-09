import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f12/Screen/Not_Ekle.dart';
import 'package:f12/Screen/Profil.dart';
import 'package:f12/Screen/Tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      body: 
          Container(
            child: TumNotlar(),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotEkle()));
        }, 
        label: Text("Not Ekle"),
        icon: Icon(Icons.add_box_rounded),
        backgroundColor: Colors.blueAccent,
        ),
    );
  }
}






class TumNotlar extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<TumNotlar> {


  bool favoriteUser = false;

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Notlar').snapshots();

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
              child: Dismissible(
                key: Key("${_usersStream}"),
                background: Container(
                  child: Icon(Icons.delete,color: Colors.white,),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                ),
                direction: DismissDirection.startToEnd,
                confirmDismiss: (direction) {
                  return showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Notu Sil"),
                      content: Text("Notu silmek istediğinize emin misiniz?"),
                      actions: [
                        TextButton(onPressed: (){}, child: Text("Evet"),),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Hayır"),),
                      ],
                    );
                  },);
                },
                child: Card(
                  color: Colors.grey[300],
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                    ),
                  ),

                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: ListTile(
                      title: data['kullanici_baslik'] == null ? const Text("Başlık Yok") :
                      Text(data['kullanici_baslik'],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.deepPurple[900]),),
                      subtitle: data['kullanici_icerik'] == null ? const Text("İçerik Yok") :
                      Text(data['kullanici_icerik']),
                      leading:favoriteUser ? IconButton(onPressed: (){
                        setState(() {
                          favoriteUser = false;
                        });
                      }, icon: Icon(Icons.favorite,color: Colors.red,)) : IconButton(onPressed: (){
                        setState(() {
                          favoriteUser = true;
                        });
                      }, icon: Icon(Icons.favorite)),
                      // trailing: ClipRRect(child: Image.asset("assets/default.png", fit: BoxFit.cover,)),
                  trailing:data['resim'] == null ? ClipRRect(child: Image.asset("assets/default.png",fit: BoxFit.cover,)) : CircleAvatar(child: Image.network("${data['resim']}",width: 100,height: 100,fit: BoxFit.cover,)),
                    ),
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