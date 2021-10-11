import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/CryptoData.dart';
import 'secondscreen.dart';

class ListingScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ListingScreen();
    }
}

class _ListingScreen extends State<ListingScreen> {

  Future<List<CryptoData>> fetchCrypto() async {
    List<CryptoData> cryptoDatas = [];

    final response = await http.get(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100&convert=USD',
        headers: {'X-CMC_PRO_API_KEY': 'a85c859d-2d9b-4806-9222-5199dc7a785a'});

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map<String, dynamic> responseJSON = json.decode(response.body);
      if (responseJSON["status"]["error_code"] == 0) {
        for (int i = 0; i < responseJSON["data"].length; i++) {
          cryptoDatas.add(CryptoData.fromJSON(responseJSON["data"][i]));
        }
        print(cryptoDatas.length);
        return cryptoDatas;
      }
    } else {
      // If that response was not OK, throw an error.
      return null;
    }
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return FutureBuilder<List<CryptoData>>(
        future: fetchCrypto(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var widthFinal = (MediaQuery.of(context).size.width - 30.0) / 5;
            return Column(
              
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Container(
                    
                    height: 20.0,
                    color: Colors.deepOrangeAccent,
                    
                    child: Row(
                    
                    children: <Widget>[
                      Container(
                          width: 30.0,
                          child: Text(
                            '#',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                      Container(
                          width: widthFinal,
                          child: Text(
                            'Name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                      Container(
                          width: widthFinal + 30,
                          child: Text(
                            'Price(\u20B9)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                      Container(
                          width: widthFinal - 10,
                          child: Text(
                            '1H',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                      Container(
                          width: widthFinal - 10,
                          child: Text(
                            '24H',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                      Container(
                          width: widthFinal - 10,
                          child: Text(
                            '7D',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'RobotoLight',
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          )),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var color1h, color24h, color7d;
                      if ((snapshot.data[index].quoteData.percent_1h
                              .toDouble()) <
                          0) {
                        color1h = Colors.red;
                      } else {
                        color1h = Colors.green;
                      }
                      if ((snapshot.data[index].quoteData.percent_24h
                              .toDouble()) <
                          0) {
                        color24h = Colors.red;
                      } else {
                        color24h = Colors.green;
                      }
                      if ((snapshot.data[index].quoteData.percent_7d
                              .toDouble()) <
                          0) {
                        color7d = Colors.red;
                      } else {
                        color7d = Colors.green;
                      }

                      return GestureDetector(
                        child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.black,
                            child: Padding(
                              
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Row(
                                
                                children: <Widget>[
                                  Container(

                                    width: 30.0,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 1.0),
                                      child: Text("${index+1}",
                                      style: TextStyle(
                                          color: Colors.white
                                      )),
                                    ),
                                  ),
                                  Container(
                                    width: widthFinal,
                                    child: Column(
                                      children: <Widget>[
                                        FittedBox(
                                          child: Text(
                                            '${snapshot.data[index].name}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'RobotoLight',
                                                color: Colors.deepOrangeAccent),
                                          ),
                                          fit: BoxFit.scaleDown,
                                        ),
                                        Text(
                                          '${snapshot.data[index].symbol}',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: widthFinal + 30,
                                    child: FittedBox(
                                      child: Text(
                                        '\u20B9 ${(snapshot.data[index].quoteData.price.toDouble()).toStringAsFixed(2)}',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: 'RobotoLight',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: FittedBox(
                                        child: Text(
                                        '${(snapshot.data[index].quoteData.percent_1h.toDouble()).toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            color: color1h,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    width: widthFinal - 10,
                                  ),
                                  Container(
                                    width: widthFinal - 10,
                                    child: FittedBox(
                                      child: Text(
                                      '${(snapshot.data[index].quoteData.percent_24h.toDouble()).toStringAsFixed(2)}%',
                                      style: TextStyle(
                                          color: color24h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Container(
                                    width: widthFinal - 10,
                                    child: FittedBox(
                                      child: Text(
                                      '${(snapshot.data[index].quoteData.percent_7d.toDouble()).toStringAsFixed(2)}%',
                                      style: TextStyle(
                                          color: color7d,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ],
                              )),
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.deepOrange,
                          )
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> SecondScreen(snapshot.data[index])
                        ));
                      },
                      );
                    },
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('No Data');
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      );
    }
}