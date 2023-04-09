import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Profil resminizi değiştirin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.account_circle),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "İsminizi değiştirin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.title),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Şifrenizi değiştirin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.key),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Kullanıcı adınızı değiştirin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.supervisor_account),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Favorilerinizi düzenleyin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.favorite),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Bildirimlerinizi açın/kapayın",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.notifications),
              ),
            ),
          ),
          Card(
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
              onTap: () {},
              child: ListTile(
                title: Text(
                  "Temanızı değiştirin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.add_home),
              ),
            ),
          )
        ],
      ),
    );
  }
}
