import 'package:fin_app/screens/authenticate/sign_in_junior.dart';
//import 'package:fin_app/screens/authenticate/sign_in_senior.dart';
import 'package:flutter/material.dart';

class Sector extends StatefulWidget {
  final String choice;
  Sector({this.choice});
  @override
  _SectorState createState() => _SectorState();
}

class _SectorState extends State<Sector> {
  String sector;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('CEO'),
              onPressed: () {
                sector = 'ceo';
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginJuniorUser(choice: widget.choice,sector:sector),)
                        );
              },
            )
          ],
        ),
      ),
    );
  }
}