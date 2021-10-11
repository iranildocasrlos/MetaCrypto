import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Thank you...\n\n'+'This application is intended to assist and bring agility in decision making when it comes to cryptocurrencies, combining price, graphic analysis and fundamental analysis.\n'+
            'We are in constant evolution and improvement, wait for news. \n\n'
          +'Email contact: suporte@localoeste.com.br\n\n\n'+
              'Local Oeste Software House https://www.localoeste.com \n\n'+
              'Made with ❤ by Local Oeste. \n\n\n',style: TextStyle(
          fontFamily: 'RobotoLight',
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),),
        ),
      );
    }
}