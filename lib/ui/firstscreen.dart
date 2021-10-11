import 'package:flutter/material.dart';
import 'listingscreen.dart';
import 'newsscreen.dart';
import 'settingsscreen.dart';
class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  
  int _currentIndex=1;
  List<Widget> widgets = [NewsScreen(0.0, ""),ListingScreen(),SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;            
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note,color: Colors.deepOrange,),
            title: Text('News',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontFamily: 'RobotoLight')),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on,color: Colors.deepOrange,),
            title: Text('Coins',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontFamily: 'RobotoLight'))
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.deepOrange,),
            title: Text('Settings',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontFamily: 'RobotoLight'))
            
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Meta Crypto',
          style: TextStyle(
              fontFamily: 'RobotoBold',
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
      body: widgets[_currentIndex],
    );
  }
}
