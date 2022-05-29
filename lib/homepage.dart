// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperform;
  void btnclicked(btnval) {
    if (btnval == "C") {
      texttodisplay = '$firstnum';
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum / secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
      child: FlatButton(
        color: Colors.black,
        textColor: Colors.white,
        hoverColor: Colors.grey[500],
        padding: const EdgeInsets.all(25.0),
        onPressed: () => btnclicked(btnval),
        child: Text(
          btnval,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                texttodisplay,
                style: const TextStyle(fontSize: 28.0),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              custombutton("1"),
              custombutton("2"),
              custombutton("3"),
              custombutton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("4"),
              custombutton("5"),
              custombutton("6"),
              custombutton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("7"),
              custombutton("8"),
              custombutton("9"),
              custombutton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          ),
        ],
      ),
    );
  }
}
