import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool check = false;
  TextEditingController num1 = TextEditingController();
  TextEditingController updateController = TextEditingController();
  List<String> contentend = [];
  var newcontentend = [];

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Text(
                            contentend[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                          Wrap(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    updateController.text = contentend[index];
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Update'),
                                            content: TextField(
                                              controller: updateController,
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      contentend[index] =
                                                          updateController.text;
                                                    });
                                                    updateController.clear();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Update'))
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      contentend.removeWhere((element) =>
                                          element == contentend[index]);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_sharp,
                                  )),
                            ],
                          )
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
