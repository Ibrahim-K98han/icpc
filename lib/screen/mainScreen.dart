import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:map_1/screen/developer.dart';
import 'package:map_1/screen/locationdemo1.dart';
import 'package:map_1/screen/locationdemo2.dart';
import 'package:map_1/screen/locationdemo3.dart';
import 'package:map_1/screen/locationdemo4.dart';

import 'location_demo.dart';
import 'locationdemo5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ICPC SCHEDULE OF EVENTS',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'ICPC SCHEDULE OF EVENTS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool s=false;
  bool second=false;
  bool third=false;
  bool fourth=false;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(child: Text('ICPC-2021',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            ),


            ListTile(
              leading:Icon(Icons.engineering) ,
              title: Text('Developer'),

              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Developer()),
                );
              },
            ),
            // ListTile(
            //   title: const Text('D'),
            //   onTap: () {
            //     // Update the state of the app
            //     // ...
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Column(

          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationDemo5()),
                      );
                    },
                    child: Container(height: 120,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset("images/bubt3.png"),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text("Find BUBT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white,),))
                      ],)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Divider(color: Colors.black,),
                ),
                //copy start
                const Padding(padding: const EdgeInsets.only(top: 30)),
                // SlideCountdown(
                //
                //   duration: const Duration(days: 3),
                //   icon: Icon(Icons.alarm_rounded, color: Colors.white),
                //   durationTitle: DurationTitle.en(),
                //   slideDirection: SlideDirection.down,
                //   separatorType: SeparatorType.title,
                //   onDone: () {
                //     print('Countdown done!');
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.watch_later_outlined),
                            CountDownText(
                              due: DateTime.parse("2022-10-06 19:00:00"),
                              finishedText: "Successfully Completed the Event",
                              showLabel: true,
                              longDateName: true,
                              daysTextLong: " DAYS ",
                              hoursTextLong: " HOURS ",
                              minutesTextLong: " MINUTES ",
                              secondsTextLong: " SECONDS ",
                              style: TextStyle(color: Colors.white,fontSize: 14,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      setState(() {
                        s=!s;
                      });

                      print(s);
                    },
                    child: Text('Oct-6, Team Arrival & Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.green),)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(color: Colors.black,),
                ),

                s?Container(

                    padding:EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // scrollDirection: Axis.vertical,
                      child: DataTable(
                          columns: [
                            DataColumn(
                              label: Container(
                                  margin: EdgeInsets.only(left: 0),
                                  child: Text('Start',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,),)),
                            ),
                            DataColumn(
                              label: Text('End',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                            ),
                            DataColumn(
                              label: Text('Details',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                            ),
                            DataColumn(
                              label: Text('Location',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                            ),

                          ], rows: [
                        DataRow(cells: [
                          DataCell(Text("15.00")),
                          DataCell(Text("19.00")),
                          DataCell(Text("Registration and Room Allocation for Accommodation")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                // passing 2 parametter
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LocationDemo()),
                                );
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                        ]),

                      ]

                      ),
                    )


                ):Container(height: 0,),

                //copy end

                //////////////////////
                const Padding(padding: const EdgeInsets.only(top:12)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.watch_later_outlined),
                            CountDownText(
                              due: DateTime.parse("2022-10-07 19:30:00"),
                              finishedText: "Successfully Completed the Event",
                              showLabel: true,
                              longDateName: true,
                              daysTextLong: " DAYS ",
                              hoursTextLong: " HOURS ",
                              minutesTextLong: " MINUTES ",
                              secondsTextLong: " SECONDS ",
                              style: TextStyle(color: Colors.white,fontSize: 14,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      setState(() {
                        second=!second;
                      });

                      print(s);
                    },
                    child: Text('Oct-7, Team Registration & Opening Day',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.green),)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(color: Colors.black,),
                ),

                second?Container(

                    padding:EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    // height: 137,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Container(
                                margin: EdgeInsets.only(left: 0),
                                child: Text('Start',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,))),
                          ),
                          DataColumn(
                            label: Text('End',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Details',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Location',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),

                        ], rows: [
                        DataRow(cells: [
                          DataCell(Text("14:00")),
                          DataCell(Text("19:00")),
                          DataCell(Text("Registration and Room Allocation for Accommodation")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                // Respond to button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LocationDemo()),
                                );
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("14:00")),
                          DataCell(Text("19:00")),
                          DataCell(Text("Team Registration & Photo Session ")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LocationDemo()),
                                );
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("15:00")),
                          DataCell(Text("16:30")),
                          DataCell(Text("ICPC Asia Dhaka Regional Contest 2021 - Opening Ceremony")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LocationDemo()),
                                );
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("16:45")),
                          DataCell(Text("18:15")),
                          DataCell(Text("ICPC Asia Dhaka Regional Contest 2021- Mock Contest")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {

                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-02 (2nd, 3rd & 4th Floor)'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-02 (2nd, 3rd & 4th Floor)"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("17:45")),
                          DataCell(Text("19:00")),
                          DataCell(Text("On-Site Coaches may join their team On-Site Coaches may bring cameras to the team area during the Mock Contest")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-02 (2nd, 3rd & 4th Floor)'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-02 (2nd, 3rd & 4th Floor)"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("18:15")),
                          DataCell(Text("19:00")),
                          DataCell(Text("Prayer Break")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Mosque'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("BUBT Mosque"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("19:00")),
                          DataCell(Text("19:30")),
                          DataCell(Text("Travel to Hotel")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo2()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-01 Main Gate'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-01 Main Gate"),onPressed: (){},)),
                        ]),
                      ],
                      ),
                    )


                ):Container(height: 0,),
/////
                const Padding(padding: const EdgeInsets.only(top:12)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.watch_later_outlined),
                            CountDownText(
                              due: DateTime.parse("2022-10-08 22:00:00"),
                              finishedText: "Successfully Completed the Event",
                              showLabel: true,
                              longDateName: true,
                              daysTextLong: " DAYS ",
                              hoursTextLong: " HOURS ",
                              minutesTextLong: " MINUTES ",
                              secondsTextLong: " SECONDS ",
                              style: TextStyle(color: Colors.white,fontSize: 14,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      setState(() {
                        third=!third;
                      });

                      print(s);
                    },
                    child: Text('Oct-8, Onsite Contest and Closing Ceremony',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:Colors.green),)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(color: Colors.black,),
                ),

                third?Container(

                    padding:EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    // height: 137,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Container(
                                margin: EdgeInsets.only(left: 0),
                                child: Text('Start',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,))),
                          ),
                          DataColumn(
                            label: Text('End',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Details',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Location',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),

                        ], rows: [
                        DataRow(cells: [
                          DataCell(Text("07:45")),
                          DataCell(Text("08:20")),
                          DataCell(Text("Entrance of the Contestants to the contest Venue")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-02 (2nd, 3rd & 4th Floor)'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("08:20")),
                          DataCell(Text("08:50")),
                          DataCell(Text(" Pre-Contest Activities(ICPC Asia Regionl Dhaka Site 2021) ")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-02 (2nd, 3rd & 4th Floor)'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("09:00")),
                          DataCell(Text("14:00")),
                          DataCell(Text("Onsite Contest (ICPC Asia Regional Dhaka Site 2021)")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('B-02 (2nd, 3rd & 4th Floor)'),
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("09:00")),
                          DataCell(Text("14:00")),
                          DataCell(Text("ICPC Broadcast for Coaches")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo3()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('International Conference Hall, 9th Floor, B-02'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-02 (2nd, 3rd & 4th Floor)"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("10:30")),
                          DataCell(Text("12:30")),
                          DataCell(Text("ICPC challenge for coaches/seminar")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo3()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('International conference hall'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-02 (2nd, 3rd & 4th Floor)"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("12:30")),
                          DataCell(Text("13:30")),
                          DataCell(Text("Lunch for Coaches")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo3()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('International Conference Hall'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("BUBT Mosque"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("14:00")),
                          DataCell(Text("15:00")),
                          DataCell(Text("Prayer and Lunch break for contestants")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo4()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('Cafeteria'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("BUBT Mosque"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("15:00")),
                          DataCell(Text("17:00")),
                          DataCell(Text("Fun Events & Indoor Games for Contestants")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("BUBT Mosque"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("17:00")),
                          DataCell(Text("19:00")),
                          DataCell(Text("ICPC Asia Dhaka Regional Contest 2021-Closing Ceremony")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo1()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-01 Main Gate"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("19:30")),
                          DataCell(Text("22:00")),
                          DataCell(Text("ICPC Asia Dhaka Regional Contest 2021-Celebration with dinner")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-01 Main Gate"),onPressed: (){},)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("22:00")),
                          DataCell(Text(".....")),
                          DataCell(Text("Trabel to Hotel")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                          //DataCell(FloatingActionButton(child: Text("B-01 Main Gate"),onPressed: (){},)),
                        ]),


                      ],
                      ),
                    )


                ):Container(height: 0,),

                ////
                const Padding(padding: const EdgeInsets.only(top:12)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.watch_later_outlined),
                            CountDownText(
                              due: DateTime.parse("2022-10-09 10:00:00"),
                              finishedText: "Successfully Completed the Event",
                              showLabel: true,
                              longDateName: true,
                              daysTextLong: " DAYS ",
                              hoursTextLong: " HOURS ",
                              minutesTextLong: " MINUTES ",
                              secondsTextLong: " SECONDS ",
                              style: TextStyle(color: Colors.white,fontSize: 14,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      setState(() {
                        fourth=!fourth;
                      });

                      print(s);
                    },
                    child: Text('Oct-9, Departure',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.green),)),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(color: Colors.black,),
                ),

                fourth?Container(

                    padding:EdgeInsets.all(15),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    // height: 137,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Container(
                                margin: EdgeInsets.only(left: 0),
                                child: Text('Start',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,))),
                          ),
                          DataColumn(
                            label: Text('End',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Details',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),
                          DataColumn(
                            label: Text('Location',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,)),
                          ),

                        ], rows: [
                        // DataRow(cells: [
                        //   DataCell(Text("07:00")),
                        //   DataCell(Text("09:00")),
                        //   DataCell(Text("Breakfast")),
                        //   DataCell(Padding(
                        //     padding: const EdgeInsets.all(5.0),
                        //     child: FloatingActionButton.extended(
                        //       backgroundColor: const Color(0xff03dac6),
                        //       foregroundColor: Colors.black,
                        //       onPressed: () {
                        //         // Respond to button press
                        //       },
                        //       icon: Icon(Icons.place_outlined),
                        //       label: Text('Your ICPC Hotel'),
                        //     ),
                        //   )),
                        // ]),
                        DataRow(cells: [
                          DataCell(Text("07:00")),
                          DataCell(Text("10:00")),
                          DataCell(Text("Check Out From your Hotel")),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                              backgroundColor: const Color(0xff03dac6),
                              foregroundColor: Colors.black,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationDemo()),);
                              },
                              icon: Icon(Icons.place_outlined),
                              label: Text('BUBT Premises'),
                            ),
                          )),
                        ]),

                      ],
                      ),
                    )


                ):Container(height: 0,)

              ],
            ),
          ],
        ),
      ),

    );
  }
}
