import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Pop-up Window Example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: expense(),
  ));
}

class expense extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<expense> {
  List<MyObject> myObjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('BUDGET TRACKER',
          style: TextStyle(
            backgroundColor: Colors.amber,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
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
                    ],
                  ),

                ),
              ),
            ),

           Expanded(
            child:  ListView.builder(
              itemCount: myObjects.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Text(
                          myObjects[index].name,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(width: 100),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            myObjects[index].number.toString(),
                            textAlign: TextAlign.right,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                myObjects.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDataDialog(context),
        child: Container(
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }

  void _showAddDataDialog(BuildContext context) {
    String name = '';
    int number = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('NEW ENTRY')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Category'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  number = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: Text('Add',),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                if (name.isNotEmpty && number > 0) {
                  setState(() {
                    myObjects.add(MyObject(name: name, number: number));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
            ElevatedButton(
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class MyObject {
  final String name;
  final int number;

  MyObject({required this.name, required this.number});
}

