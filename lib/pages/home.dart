import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUDGET TRACKER',
        textScaleFactor: 1.5,

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
    body: Column(


        children: [
          Center(
            child: Padding(

              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Icon(
                    Icons.person_outline_outlined,
                    size: 100.0,
                  color: Colors.black,
                )
         ),
            ),
          ),
          Container(
            child: Text('Welcome Back!',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              textScaleFactor: 1.5,

            ),
          ),
          SizedBox(height:199.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(child: Text('Total : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),

                Text('48700',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
                ),

                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/expense screen');
                  },
                  icon: Icon(Icons.account_balance_wallet),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.amberAccent,  // Set the background color
              borderRadius: BorderRadius.circular(10),  // Set border radius
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ],

    ),
    );
  }
}
