

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

class resultshow extends StatefulWidget {
  const resultshow({super.key});

  @override
  State<resultshow> createState() => _resultshowState();
}

class _resultshowState extends State<resultshow> {

  @override
  Widget build(BuildContext context) {
     DateTime time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Result of Today Matches"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('results').where('Date', isEqualTo: DateFormat.yMMMd().format(time)).snapshots(),
          builder: ((context, Mydata) {
            if (Mydata.hasData) {
              var documents = Mydata.data!.docs;
              print(documents);
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: ((context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Winner :"+
                          '${documents[index]['winner']}',
                          style: TextStyle(fontSize: 23),
                        ),
                        Text("1st runner up :"
                          '${documents[index]['1st runner up']}',
                          style: TextStyle(fontSize: 23),
                        ),
                        Text("2nd runner up :"
                          '${documents[index]['second runner up']}',
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    )),
              );
            }
            return CircularProgressIndicator();
          })),
    );
  }
}
