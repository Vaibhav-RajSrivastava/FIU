import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Info {
  final String id;
  //final String heading, body, short, date, time, alert;
  final String name, email, post, sector;

  Info({
    this.id,
    this.name,
    this.email,
    this.post,
    this.sector,
    /* this.short,
    this.date,
    this.time,
    this.alert */
  });

  factory Info.fromJson(Map<String, dynamic> jsonData) {
    return Info(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      post: jsonData['post'],
      sector: jsonData['sector'],

      /* date: jsonData['date'],
      time: jsonData['time'],
      alert: jsonData['alert'] */
    );
  }
}

class Inbox extends StatefulWidget {
  final List<Info> information;
  final String userid, choice;

  Inbox({this.information, this.userid, this.choice});

  

  

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  
  logout(BuildContext context){
 
  Navigator.pop(context);
 
}
  

  

  var refreshKey = GlobalKey<RefreshIndicatorState>();

 /*  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      
    });

    return null;
  }

  Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You will never be satisfied.'),
              Text('You\’re like me. I’m never satisfied.'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Regret'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
} */
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.information.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(widget.information[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Info inform, BuildContext context) {
    return new ListTile(
        title: new Container(
            
            margin: EdgeInsets.only(top: 50),
            /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            elevation: 5.0, */
            child: new Column(
              /* padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0), */
              children:<Widget>[ 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text(inform.name, style:TextStyle(fontSize: 70)),
                    padding: EdgeInsets.only(bottom: 8.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(inform.email, style: TextStyle(fontSize: 25),),
                  ),
                  
                    Padding(
                        child: Text(
                          inform.sector,
                          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          textAlign: TextAlign.right,
                          
                        ),
                        padding: EdgeInsets.all(1.0)),
                  
                    Padding(
                        child: Text(
                          inform.post,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 25),
                        ),
                        padding: EdgeInsets.all(1.0)),
                  RaisedButton(
          onPressed: () {
            logout(context);
          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text('Click Here To Logout'),
        ),
                ],
              ),
              ]
            ),
          ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: inform),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}


//Future is n object representing a delayed computation.
/* Future<List<Info>> downloadJSON() async {
  final jsonEndpoint = "";
  
  
  var data = {'userid':userid};
  print(data);
  var response = await http.post(jsonEndpoint, body: json.encode(data));
  //final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List information = json.decode(response.body);
    return information.map((inform) => new Info.fromJson(inform)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
} */

class SecondScreen extends StatefulWidget {
  final Info value, userid, choice;

  

  SecondScreen({Key key, this.value, this.userid, this.choice}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Details')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'Circular Details',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                //child: Text('${widget.value.date}'),
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'SUBJECT : ${widget.value.name}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  widget.value.email,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              
              /* ToggleButtons(
  children: <Widget>[
    Icon(Icons.save_alt),
    
  ],
  onPressed: (int index) {
    setState(() {
      saveCircular();
      isSelected[index] = !isSelected[index];
    });
  },
  isSelected: isSelected,
) */
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  final String userid, choice, sector;
  Profile({this.userid, this.choice, this.sector});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<List<Info>> downloadJSON() async {
  final jsonEndpoint = "";
  
  
  var data = {'userid':widget.userid, 'choice': widget.choice, 'sector':widget.sector};
  print(data);
  var response = await http.post(jsonEndpoint, body: json.encode(data));
  //final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List information = json.decode(response.body);
    return information.map((inform) => new Info.fromJson(inform)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(title: Text('SAVED CIRCULARS', style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
        body: new Center(
            //FutureBuilder is a widget that builds itself based on the latest snapshot
            // of interaction with a Future.
            child: new FutureBuilder<List<Info>>(
              future: downloadJSON(),
              //we pass a BuildContext and an AsyncSnapshot object which is an
              //Immutable representation of the most recent interaction with
              //an asynchronous computation.
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Info> information = snapshot.data;
                  return new Inbox(information: information, userid: widget.userid, choice: widget.choice,);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                //return  a circular progress indicator.
                return new CircularProgressIndicator();
              },
            ),
          ),
      ),
    );
  }
}

void main() {
  runApp(Profile());
}
//end
