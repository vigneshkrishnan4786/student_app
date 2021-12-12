import 'package:flutter/material.dart';

class ViewDetailClass extends StatefulWidget {
  final int? size;
  final String? layout;
  final int? id;
  final String? name;
  const ViewDetailClass({Key? key, this.layout, this.size, this.id, this.name})
      : super(key: key);

  @override
  _ViewDetailScreenState createState() => _ViewDetailScreenState();
}

class _ViewDetailScreenState extends State<ViewDetailClass> {
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
                    " layout:${widget.layout}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "size :${widget.size}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
