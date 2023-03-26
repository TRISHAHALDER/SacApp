import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class testfetch extends StatefulWidget {
  const testfetch({super.key});

  @override
  State<testfetch> createState() => _testfetchState();
}

class _testfetchState extends State<testfetch> {
  // String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  // List output = [];
  // void todayevents(String formattedDate) async {
  //   final result = await FirebaseFirestore.instance
  //       .collection('posts')
  //       .where(
  //         'Date',
  //         isEqualTo: formattedDate,
  //       )
  //       .get();
  //   setState(() {
  //     output = result.docs.map((e) => e.data()).toList();
      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  List output = [];
  void todayevents(String formattedDate) async {
    final result = await FirebaseFirestore.instance
        .collection('posts')
        .where(
          'Date',
          isEqualTo: formattedDate,
        )
        .get();
    setState(() {
      output = result.docs.map((e) => e.data()).toList();
      
    });
  }
    return Scaffold(
      appBar: AppBar(title: const Text("TestFetch Method")),
      body: Column(
        children: [
          Text("${formattedDate}"),
          
          Expanded(
            child: ListView.builder(
              itemCount: output.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(output[index]['Gametype']),
                  subtitle: Text(output[index]['Team1']),
                );
              },
            ),
          ),
          // ListView.builder(
          //     itemCount: output.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Expanded(
                      
          //             child: ListView(
          //               children: <Widget>[ ListTile(
          //                 title: Text(output[index]['Team1']),
          //                 // subtitle: Column(
          //                 //   children: [
                             
          //                 //    Text(output[index]['Gametype']),
          //                 //     Row(children: [
          //                 //       Text(output[index]['Team1']),
          //                 //       Text("vs"),
          //                 //       Text(output[index]['Team2']),
          //                 //     ]),
          //                 //     Text(output[index]['venue']),
          //                 //   ],
          //                 // ),
          //               ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       );
          //     })
        ],
      ),
    );
  }
}
