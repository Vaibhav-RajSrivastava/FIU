import 'dart:async';
import 'package:fin_app/inside_app/junior_official/junior_official_query.dart';
import 'package:fin_app/inside_app/senior_official/ask_expert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:http/http.dart' as http;

class Info {
  final String id;
  //final String heading, body, short, date, time, alert;
  final String heading, body, short, timestamp;

  Info({
    this.id,
    this.heading,
    this.body,
    this.short,
    this.timestamp
    /* this.short,
    this.date,
    this.time,
    this.alert */
  });

  factory Info.fromJson(Map<String, dynamic> jsonData) {
    return Info(
      id: jsonData['id'],
      heading: jsonData['heading'],
      short: jsonData['short'],
      body: jsonData['body'],
      timestamp: jsonData['timestamp'],
      /*time: jsonData['time'],
      alert: jsonData['alert'] */
    );
  }
}

class Inbox extends StatefulWidget {
  final List<Info> information;
  final String userid, choice, sector;

  Inbox({this.information, this.userid, this.choice, this.sector});

  

  

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  

  

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
          margin: EdgeInsets.only(top: 10),
          /* shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          elevation: 5.0, */
          child: Column(
              /* padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0), */
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      child: Text(inform.heading, style: TextStyle(fontSize: 18),),
                      
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(inform.short, style: TextStyle(fontSize: 14),),
                    ),
                    Row(children: <Widget>[
                      /* Padding(
                          child: Text(
                            inform.date,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                          padding: EdgeInsets.all(1.0)), */

                      Padding(
                          child: Text(
                            inform.timestamp,
                             style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                          padding: EdgeInsets.all(1.0)),
                    ]),
                  ],
                ),
                Divider(color: Colors.red[800],)
              ]),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: inform, userid:widget.userid, choice:widget.choice, sector: widget.sector),
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
  final Info value;
  final String userid, choice, sector;
  
  SecondScreen({Key key, this.value, this.userid, this.choice, this.sector}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  Future sendmailCircular() async {
    /* if(save == 0){
      save = 1;
    } else {
      save = 0;
    } */
    // Showing CircularProgressIndicator.

    // Getting value from Controller

    // SERVER LOGIN API URL
    var url = '';

    // Store all data with Param Name.
    var data = {
      'body': widget.value.body,
      'heading': widget.value.heading,
      'short': widget.value.short,
      'choice': widget.choice,
      //'sector': widget.sector
    };
    print(data);
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Circular Sent') {
      // Hiding the CircularProgressIndicator.

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

  Future sendCircular() async {
    /* if(save == 0){
      save = 1;
    } else {
      save = 0;
    } */
    // Showing CircularProgressIndicator.

    // Getting value from Controller

    // SERVER LOGIN API URL
    var url = '';

    // Store all data with Param Name.
    var data = {
      'userid': widget.userid,
      'body': widget.value.body,
      'heading': widget.value.heading,
      'short': widget.value.short,
      'choice': widget.choice,
      //'sector': widget.sector
    };
    print(data);
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Circular Sent') {
      // Hiding the CircularProgressIndicator.

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

  Future queryCircular() async {
    /* if(save == 0){
      save = 1;
    } else {
      save = 0;
    } */
    // Showing CircularProgressIndicator.

    // Getting value from Controller

    // SERVER LOGIN API URL
    var url = '';

    // Store all data with Param Name.
    var data = {
      'userid': widget.userid,
      'body': widget.value.body,
      'short': widget.value.short,
      'heading': widget.value.heading,
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
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: new Text(
          'Circular Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: new Container(
        child: SingleChildScrollView(
          child: new Center(
            child: Column(
              children: <Widget>[
                
                Padding(
                  //`widget` is the current configuration. A State object's configuration
                  //is the corresponding StatefulWidget instance.
                  child: Text(widget.value.heading, style: TextStyle(fontSize: 18),),
                  padding: EdgeInsets.all(20.0),
                ),
                
                Padding(
                  child: new Text(
                    'SUBJECT : ${widget.value.short}',
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Padding(
                  child: new Text(
                    widget.value.body,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      child: RaisedButton(
                        child: Text('Send'),
                        onPressed: () {
                          sendCircular();
                          sendmailCircular();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      child: RaisedButton(
                        child: Text("Queries"),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Query()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      child: RaisedButton(
                        child: Text("Ask Expert"),
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AskExpert(
                            userid: widget.userid,
                            heading: widget.value.heading,
                            body: widget.value.body,
                            short: widget.value.short,
                            choice: widget.choice,
                            sector: widget.sector,
                            ),)
                        );
                        },
                      ),
                    )
                  ],
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
      ),
    );
  }
}

class Save extends StatefulWidget {
  final String userid, choice, sector;
  Save({this.userid, this.choice, this.sector});
  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {

  Future<List<Info>> downloadJSON() async {
  final jsonEndpoint = "";
  
  
  var data = {'userid':widget.userid};
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
        appBar: AppBar(title: Text('SAVED CIRCULARS', style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,),
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
                  return new Inbox(information: information, userid: widget.userid,choice: widget.choice,sector:widget.sector);
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
  runApp(Save());
}
//end
