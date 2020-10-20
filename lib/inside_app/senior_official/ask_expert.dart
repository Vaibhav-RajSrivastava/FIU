import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fin_app/inside_app/junior_official/junior_official_login.dart';

class AskExpert extends StatefulWidget {
  final String choice, sector, userid, heading, body, short;
  AskExpert({this.choice, this.sector, this.userid, this.heading, this.body, this.short});
  @override
  _AskExpertState createState() => _AskExpertState();
}

class _AskExpertState extends State<AskExpert> {
  bool visible = false;

  // Getting value from TextField widget.
  final questionController = TextEditingController();
  

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String question = questionController.text;
    

    // SERVER LOGIN API URL
    

    // Store all data with Param Name.
    var url = '';

    // Store all data with Param Name.
    var data = {
      'question': question,
      'userid': widget.userid,
      'body': widget.body,
      'short': widget.short,
      'heading': widget.heading,
      'post': widget.sector,
      'sector': widget.choice
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Query Sent') {
      // Hiding the CircularProgressIndicator.
      
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 50),
              width: 330,
              child: TextField(
                controller: questionController,
                autocorrect: true,
                decoration: InputDecoration(
                    
                    hintText: 'Enter your question here',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              )),
          
          Container(
            margin: EdgeInsets.only(top: 40),
            height: 65,
            width: 330,
            child: RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.all(0.0),
              onPressed: userLogin,
              child: Container(
                alignment: Alignment.center,
                width: 330,
                height: 65,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blue[900],
                        Colors.blue[700],
                        Colors.blue[400],
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text(
                  'Ask an expert',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
          ),
          
          
        ],
      ),
    )));
  }
}
