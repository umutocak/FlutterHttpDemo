
import 'package:flutter/material.dart';
import 'package:flutter_http_demo/models/student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  Student student = new Student(0,"","","","","",0,"",0);
  var name = TextEditingController();
  var surname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: name,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  helperText: 'Maximum character',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: surname,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'SurName',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  helperText: 'Maximum character',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: 'Mail',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  helperText: 'Maximum character',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: password,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.red,
                  ),
                  helperText: 'Maximum character',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  student.firstName = name.text;
                  student.lastName = surname.text;
                  student.email = email.text;
                  student.password = password.text;
                  addStudent(student);
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("Send data"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addStudent(Student student) async {
    http.Response response = await http.post(
      Uri.parse("https://api.onurylmz.com/mobile-students/create"),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      },
      body: jsonEncode(student),
    );

    if(response.statusCode == 200){
      return debugPrint("Başarılı !");
    }else{
      throw Exception("Bağlanamadı ! Hata kodu: ${response.statusCode}");
    }

  }
}
