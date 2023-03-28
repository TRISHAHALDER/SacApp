import 'package:flutter/material.dart';
import 'package:sac_event_manager/result.dart';
import 'color.dart' as color;
import 'package:sac_event_manager/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 46, left: 10, right: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "SAC Event Manager",
                      style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 20,
                      color: color.AppColor.homeColorIcon,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 28,
                      color: color.AppColor.homeColorIcon,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Sports Intramurals",
                      style: TextStyle(
                        fontSize: 15,
                        color: color.AppColor.homePageSubTitle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 120, left: 10, right: 15, bottom: 60),
                child:StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').where('Date', isEqualTo: DateFormat.yMMMd().format(time)).snapshots(),
          builder: ((context, Mydata) {
            if (Mydata.hasData) {
              var documents = Mydata.data!.docs;
              print(documents);
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: ((context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Gametype :"+
                          '${documents[index]['Gametype']}',
                          style: TextStyle(fontSize: 23),
                        ),
                        Text("Team1 :"
                          '${documents[index]['Team1']}',
                          style: TextStyle(fontSize: 23),
                        ),
                        Text("Team2 :"
                          '${documents[index]['Team2']}',
                          style: TextStyle(fontSize: 23),
                        ),
                         Text("venue :"
                          '${documents[index]['venue']}',
                          style: TextStyle(fontSize: 23),
                        ),
                         Text("DateTime :"
                          '${ ((documents[index]['DateTime']).toDate())
                                  .toString()}',
                          style: TextStyle(fontSize: 23),
                        ),
                         Text("Description :"
                          '${documents[index]['Description']}',
                          style: TextStyle(fontSize: 23),
                        ),
                      ],
                    )),
              );
            }
            return CircularProgressIndicator();
          })),
            // child: SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         child: Stack(children: [
            //           Container(
            //             width: MediaQuery.of(context).size.width,
            //             height: 180,
            //             decoration: BoxDecoration(
            //                 gradient: LinearGradient(colors: [
            //                   color.AppColor.gradientSecond,
            //                   color.AppColor.gradientFirst.withOpacity(0.5)
            //                 ]),
            //                 borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(20),
            //                     bottomRight: Radius.circular(20),
            //                     topRight: Radius.circular(80),
            //                     bottomLeft: Radius.circular(10)),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     offset: Offset(5, 10),
            //                     blurRadius: 15,
            //                     color: color.AppColor.gradientFirst
            //                         .withOpacity(0.3),
            //                   ),
            //                 ]),
            //           ),
            //           Container(
            //             height: 50,
            //             width: 200,
            //             decoration: BoxDecoration(
            //                 backgroundBlendMode: BlendMode.overlay,
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: color.AppColor.tab),
            //             child: TextButton(
            //               child: Text(
            //                 "Present Events",
            //                 style: TextStyle(
            //                   fontSize: 15,
            //                   color: color.AppColor.homePageSubTitle2,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //               onPressed: () {},
            //             ),
            //           ),
            //         ]),
            //       ),
            //       SizedBox(height: 10),
            //       Container(
            //         height: 200,
            //         width: MediaQuery.of(context).size.width,
            //         child: Stack(
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: 200,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://th.bing.com/th?id=OIP.xO_g4Z1caZDcyPnoZK-e7gHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
            //                   fit: BoxFit.fill,
            //                   colorFilter: ColorFilter.mode(
            //                       color.AppColor.gradientFirst.withOpacity(0.7),
            //                       BlendMode.dstATop),
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               height: 50,
            //               width: 200,
            //               decoration: BoxDecoration(
            //                   backgroundBlendMode: BlendMode.overlay,
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: color.AppColor.tab),
            //               child: TextButton(
            //                 child: Text(
            //                   "Upcoming Events",
            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     color: color.AppColor.homePageSubTitle2,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 onPressed: () {},
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Container(
            //         height: 200,
            //         width: MediaQuery.of(context).size.width,
            //         child: Stack(
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: 180,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(20),
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://th.bing.com/th/id/OIP.SsVmGSRb_FUQHo1FvYEelgHaEO?w=303&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
            //                   fit: BoxFit.fill,
            //                   colorFilter: ColorFilter.mode(
            //                       color.AppColor.gradientFirst.withOpacity(0.3),
            //                       BlendMode.dstATop),
            //                 ),
            //               ),
            //             ),
            //             Container(
            //               height: 50,
            //               width: 200,
            //               decoration: BoxDecoration(
            //                   backgroundBlendMode: BlendMode.overlay,
            //                   borderRadius: BorderRadius.circular(20),
            //                   color: color.AppColor.tab),
            //               child: TextButton(
            //                 child: Text(
            //                   "past Events",
            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     color: color.AppColor.homePageSubTitle2,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 onPressed: () {},
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
          Positioned(
            left: 15,
            bottom: 0,
            child: Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                        icon: Icon(
                          Icons.admin_panel_settings_rounded,
                          size: 32,
                          color: color.AppColor.homeColorIcon,
                        ),
                      ),
                      Text('Admin'),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(children: [
                    IconButton(
                        onPressed: () {
                    },
                      icon: Icon(
                        Icons.dashboard,
                        size: 32,
                        color: color.AppColor.homeColorIcon,
                      ),
                    ),
                    Text('MyDashboard'),
                  ]),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const resultshow()));                },
                        icon: Icon(
                          Icons.scoreboard_sharp,
                          size: 32,
                          color: color.AppColor.homeColorIcon,
                        ),
                      ),
                      Text('ScoreBoard'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
