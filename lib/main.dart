import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load JSON App"),
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('load_json/person.json'),
          builder: (context, snapshot) {
            var mydata = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Name: " + mydata[index]['name']),
                      Text("Age: " + mydata[index]['age']),
                      Text("Height: " + mydata[index]['height']),
                      Text("Hair Color: " + mydata[index]['Hair_color']),
                      Text("Gender: " + mydata[index]['gender']),
                    ],
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        ),
      ),
    );
  }
}
