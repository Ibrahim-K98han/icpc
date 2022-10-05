import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
class Developer extends StatefulWidget {
  const Developer({Key? key}) : super(key: key);

  @override
  State<Developer> createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Developer"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: OverflowBox(
                minHeight: 270,
                maxHeight: 270,
                child:  Lottie.asset('images/99312-developer-skills.json'),
              ),
            ),

            SizedBox(height: 20,),
            Text("Md.Reazul Islam",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            Text("Lecturer, Dept 0f CSE, BUBT",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold)),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(height: 7,color: Colors.black,),
            ),

            SizedBox(height: 10,),
            Text("Ibrahim Khan(Student, Dept of CSE)",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(height: 7,color: Colors.black,),
            ),
            Text("Md. Manzurul Islam(Student , Dept of CSE)",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(height: 7,color: Colors.black,),
            ),
            Text("Supervised By",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            Text("Md.Reazul Islam, Dept 0f CSE, BUBT",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(height: 7,color: Colors.black,),
            ),
            Text("Powered By",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            Text("Dept 0f CSE, BUBT",style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold)),
            // / RaisedButton(
            //    onPressed: _callNumber,
            //    child: Text('Call Number'),
            //  ),
          ],
        ),
      ),
    );
  }
}
