import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: ElevatedButton(
          //      style: ElevatedButton.styleFrom(
          //        primary: Color.fromARGB(255, 158, 158, 235)),

          //     // child: Text(
          //     //   'Save',
          //     //   style: TextStyle(
          //     //       color: Color.fromARGB(255, 10, 10, 10),
          //     //       fontWeight: FontWeight.bold,
          //     //       fontSize: 15),
          //     // ),

          //      onPressed: () {},

          //   ),
          // ),
        ]),
      ),
    );
  }
}
