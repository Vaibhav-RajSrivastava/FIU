import 'package:fin_app/inside_app/senior_official/post_choice.dart';
import 'package:fin_app/screens/authenticate/sign_in_senior.dart';
import 'package:flutter/material.dart';

class ChoiceSenior extends StatefulWidget {
  @override
  _ChoiceSeniorState createState() => _ChoiceSeniorState();
}

class _ChoiceSeniorState extends State<ChoiceSenior> {
  String choice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Select your sector',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 70),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 40),
                            height: 65,
                            width: 330,
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.all(0.0),
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Text(
                                    'Banking',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )),
                              onPressed: () {
                                choice = 'banking';
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginSeniorUser(
                                              choice: choice,
                                            )));
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            height: 65,
                            width: 330,
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.all(0.0),
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Text(
                                    'Insurance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )),
                              onPressed: () {
                                choice = 'insurance';
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginSeniorUser(
                                              choice: choice,
                                            )));
                              },
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            height: 65,
                            width: 330,
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.all(0.0),
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Text(
                                    'Pension',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.white),
                                  )),
                              onPressed: () {
                                choice = 'pansion';
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginSeniorUser(
                                              choice: choice,
                                            )));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
