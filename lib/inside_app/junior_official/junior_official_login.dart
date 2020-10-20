import 'package:fin_app/inside_app/junior_official/junior_official_contact_us.dart';
import 'package:fin_app/inside_app/junior_official/junior_official_profile.dart';
import 'package:fin_app/inside_app/junior_official/junior_official_save.dart';
import 'package:fin_app/inside_app/junior_official/junior_official_query_manual.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/inside_app/junior_official/junior_official_inbox.dart';

class JuniorOfficialLogin extends StatefulWidget {
  final String userid, sector, choice;
  JuniorOfficialLogin({Key key, @required this.userid, this.sector, this.choice}) : super(key: key);
  @override
  _JuniorOfficialLoginState createState() => _JuniorOfficialLoginState();
}

class _JuniorOfficialLoginState extends State<JuniorOfficialLogin> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      var pages;
       @override
  void initState() {
     pages = [
        New(userid: widget.userid, choice: widget.choice, sector: widget.sector,),
        Save(userid:widget.userid, choice: widget.choice, sector: widget.sector,),
        QueryManual(userid:widget.userid, choice: widget.choice, sector: widget.choice,),
        Profile(userid:widget.userid, choice: widget.choice, sector: widget.choice,),
        ContactUs()
      ];
    // TODO: implement initState
    super.initState();
  }
  /* static const List<Widget> _widgetOptions = <Widget>[
    Container(child: ,),
    Text(
      'Index 1: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 2: ',
      style: optionStyle,
    ),
    Text(
      'Index 3: ',
      style: optionStyle,
    ),
  ]; */

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
logout(BuildContext context){
 
  Navigator.pop(context);
 
}

@override
Widget build(BuildContext context) {
return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: Text('Save'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Queries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Contact'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}