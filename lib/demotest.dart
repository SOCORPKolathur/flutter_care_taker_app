import 'package:flutter/material.dart';

class Demotest2 extends StatefulWidget {
  const Demotest2({Key? key}) : super(key: key);

  @override
  State<Demotest2> createState() => _Demotest2State();
}

class _Demotest2State extends State<Demotest2> {
  
  List name =["P1","P2","P3","P1","P2","P3","P1","P2","P3"];
  List price =["40","80","90"];
  List img =[
    "assets/walking_stick.png","assets/walking_stick.png","assets/walking_stick.png",
    "assets/walking_stick.png","assets/walking_stick.png","assets/walking_stick.png",
    "assets/walking_stick.png","assets/walking_stick.png","assets/walking_stick.png",
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            Container(
              width: 150,
              height: 220,
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  Image.asset( "assets/walking_stick.png"),
                  Text("fhfhjhgjgh")
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/4
            ),
                physics: NeverScrollableScrollPhysics(),

                itemCount: img.length,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 10,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      Image.asset(img[index]),
                      Text(name[index])
                    ],
                  ),
                ),
              );

                }


            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 100,
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 59,
              color:Colors.red

            ),
            Container(
              width: 100,
              height: 59,
              color:Colors.blue

            ),
          ],
        ),
      ),
    );
  }
}
