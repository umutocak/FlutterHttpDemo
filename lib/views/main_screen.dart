import 'package:flutter/material.dart';
import 'package:flutter_http_demo/views/insert_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreenState(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreenState extends StatefulWidget{
  @override
  _MainScreenState createState()=>_MainScreenState();

}

class _MainScreenState extends State<MainScreenState>{
  var pageList=[HomePage(), InsertScreen()];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Demo",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        shadowColor: Colors.black26,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Http Demo App',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.red,
              ),

            ),
            ListTile(
              leading: Icon(Icons.http, size: 40,),
              title: Text('Get Data'),
              subtitle: Text("Verileri göster"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.http, size: 40,),
              title: Text('Add Data'),
              subtitle: Text("Veri gönder"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_forward),label: "GetAll"),
          BottomNavigationBarItem(icon: Icon(Icons.http),label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: "Info"),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
      ),

    );
  }
}