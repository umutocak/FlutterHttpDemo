

import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_http_demo/models/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }

}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  Post post;

  Future<List<Post>> _getAll() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));
    if(response.statusCode == 200){
      return (json.decode(response.body) as List).map((e)=> Post.fromJson(e)).toList();
    } else {
      throw Exception("Bağlanmadı, Hatanın kodu : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                var postData = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                  child: ExpansionTileCard(
                    baseColor: Colors.white38,
                    expandedColor: Colors.white54,
                    leading: Icon(Icons.http, color: Colors.red, size: 40,),
                    title: Text(postData.title, style: TextStyle(color: Colors.black),),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(postData.body,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: [
                          Text(postData.id.toString()),
                          Text(postData.userId.toString())
                        ],
                      ),
                    ],
                  ),

                );
              }
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}