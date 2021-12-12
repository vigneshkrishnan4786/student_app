import 'package:flutter/material.dart';

class ViewDetailSubject extends StatefulWidget {
  final int? credits;
  final String? teacher;
  final int? id;
  final String? name;
  const ViewDetailSubject(
      {Key? key, this.credits, this.teacher, this.id, this.name})
      : super(key: key);

  @override
  _ViewDetailScreenState createState() => _ViewDetailScreenState();
}

class _ViewDetailScreenState extends State<ViewDetailSubject> {
  String? value;
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.red,
                child: Text('Cancel'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () async {},
                child: Text('Save'),
              ),
            ],
            title: Text('Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Write a subject', labelText: 'subject'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Write a classroom',
                        labelText: 'classroom'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Container(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Id :   ${widget.id}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Name :${widget.name}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Credits:${widget.credits}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "teacher :${widget.teacher}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
