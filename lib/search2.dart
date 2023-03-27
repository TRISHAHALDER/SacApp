import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseSearchScreen2 extends StatefulWidget {
  const FirebaseSearchScreen2({Key? key}) : super(key: key);

  @override
  State<FirebaseSearchScreen2> createState() => _FirebaseSearchScreen2State();
}

class _FirebaseSearchScreen2State extends State<FirebaseSearchScreen2> {
  List searchResult = [];
String dropdownValue = 'Cricket';
            
  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('posts')
        .where('Gametype', isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for any Games"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:  DropdownButton<String>(
                    dropdownColor: Color.fromARGB(255, 153, 153, 181),
                    value: dropdownValue,
                    items: <String>[
                      'Cricket',
                      'Football',
                      'Basketball',
                      'Badminton',
                      'WeightLifting'
                    ].map<DropdownMenuItem<String>>((String gametype) {
                      return DropdownMenuItem<String>(
                        value: gametype,
                        child: Text(
                          gametype,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (query) {
                      searchFromFirebase(query!);
                    },
                  ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Game :" + searchResult[index]['Gametype']),
                  subtitle: //Text(searchResult[index]['Team1']),
                      Column(
                    children: [
                      // Text(searchResult[index]['Gametype']),
                      Row(children: [
                        Text(
                          "Team1 :" + searchResult[index]['Team1'],
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic),
                        ),
                        Text(" Vs"),
                        Text("Team2 :" + searchResult[index]['Team2'],
                            style: TextStyle(
                                fontSize: 24, fontStyle: FontStyle.italic)),
                      ]),
                      Text(
                          "Time : " +
                              ((searchResult[index]['DateTime']).toDate())
                                  .toString(),
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic)),
                      Text("Venue :" + searchResult[index]['venue'],
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic)),
                      Text("Description :" + searchResult[index]['Description'],
                          style: TextStyle(
                              fontSize: 24, fontStyle: FontStyle.italic)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
