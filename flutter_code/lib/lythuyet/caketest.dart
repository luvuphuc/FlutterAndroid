import 'package:flutter/material.dart';

class MyCake extends StatelessWidget {
  const MyCake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My test cake"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurpleAccent)
                    ),
                    child: Text("My strawberry cake",
                        style:TextStyle(
                            fontWeight: FontWeight.bold
                        )
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-46,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Expanded(
                      child: Text(
                        "Pavlova is a meringue-based dessert name after the Russian ballerine Anna Pavlova.ádsadsadsadsadsadsasadsadsadsadsasadsadsadsadsa",textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width-46,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.black),
                            Icon(Icons.star, color: Colors.black),
                            Icon(Icons.star, color: Colors.black),
                            Icon(Icons.star, color: Colors.black),
                            Icon(Icons.star, color: Colors.black)
                          ],
                        ),
                      Text(
                        '170 Reviews',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5,
                          fontSize: 20.0,
                        ),)
                      ],
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Text("My strawberry cake"),
                  )
                ],
                  ),
                    ],
                  )
                ),
      )
            );
  }
}
