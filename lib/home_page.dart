import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var num1 = TextEditingController();
  List<String> contentend = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo-App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: num1,
                  decoration: InputDecoration(
                      labelText: 'Enter the task',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.text_fields)),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var _text = num1.text;
                        contentend.add(_text);
                        num1.clear();
                      });
                    },
                    child: Text('Add')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        contentend.clear();
                        num1.clear();
                      });
                    },
                    child: Text('Remove'))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Today task is...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: contentend.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: Color(0xffF0F8FF),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 3.0,
                                spreadRadius: 2.0),
                          ]),
                      child: Row(
                        children: [
                          Icon(Icons.favorite_border_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Text(
                            contentend[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
