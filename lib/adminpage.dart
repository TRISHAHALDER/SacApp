import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sac_event_manager/resultpage.dart';
import 'package:sac_event_manager/utils.dart';
import 'color.dart' as color;

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  String dropdownValue = 'Cricket';
  DateTime selectedDateTime = DateTime.now();
  final bool expands = false;
  bool isLoading = false;

  final TextEditingController _descriptionController = TextEditingController();
  String team1 = "None";
  String team2 = "None";
  String gametype = "cricket";
  DateTime time = DateTime.now();
  String des = "welcome";
  String venue = "OAT";
  //String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('posts');
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'Gametype': gametype, 
            'Team1': team1, 
            'Team2': team2,
            'DateTime': time, 
            'venue':venue,
            'Description':des,// 42
            'Date':DateFormat.yMMMd().format(time),
          })
          .then((value) => print("Event Added"))
          .catchError((error) => print("Failed to add event: $error"));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Container(
                child: Text(
                  "Admin Page",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  top: 30,
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 20),
                child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const resultpage()));
                      },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 32,
                            color: color.AppColor.homeColorIcon,
                          ),
                        ),
                        Text('Add result'),
                      ],
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 154, 165, 224),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Select Gametype:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
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
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                        gametype = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 130, left: 5),
                    child: Text(
                      "Enter the Date and Time below",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  DateTimeField(
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDateTime = value;
                        time = value;
                      });
                    },
                    selectedDate: selectedDateTime,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {
                  team1 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Team1',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  team2 = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Team2',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                 onChanged: (value1) {
                  venue = value1;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter the Venue here',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 154, 165, 224),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                 onChanged: (value) {
                  des = value;
                },
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Any Description',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                addUser();
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Loading...',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    )
                  : const Text('Submit'),
            ),
          ),
        ]),
      ),
    );
  }
}
