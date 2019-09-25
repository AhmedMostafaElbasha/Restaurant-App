import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Container(
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 35,
            ),
            _mySearchBox(),
            new SizedBox(
              height: 20,
            ),
            _myTitle(),
            new SizedBox(
              height: 20,
            ),
            _weekMealList(),
            new SizedBox(
              height: 40,
            ),
            _todayOffersTitles(),
            new SizedBox(
              height: 15,
            ),
            _todayMealList(),
          ],
        ),
      ),
    );
  }

  Widget _mySearchBox() {
    return new SizedBox(
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              iconSize: 40, onPressed: () {},
            ),
            Expanded(
                child: new TextField(
              decoration:
                  InputDecoration.collapsed(hintText: "Search for meal here."),
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
      width: 390,
    );
  }

  Widget _myTitle() {
    return new SizedBox(
      width: 390,
      child: new Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(width: 5, color: Colors.deepPurple))),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              "  POPULAR MEALS",
              style: TextStyle(fontSize: 25),
            ),
            new Text(
              "   THIS WEEK",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weekMealList() {
    return new SizedBox(
      child: Container(
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _getWeeklyMealCard(
                mealName: "Burger",
                imageFile: "Assets/background.jpg",
                currentPrice: 10,
                realPrice: 15),
            _getWeeklyMealCard(
                mealName: "French Fries",
                imageFile: "Assets/french_fries.jpeg",
                currentPrice: 1.0,
                realPrice: 5.0),
            _getWeeklyMealCard(
                mealName: "Grilled Chicken",
                imageFile: "Assets/grilled_chicken.jpg",
                currentPrice: 25,
                realPrice: 35),
            _getWeeklyMealCard(
                mealName: "Shrimps",
                imageFile: "Assets/shrimps.jpeg",
                currentPrice: 35,
                realPrice: 55),
          ],
        ),
      ),
      width: 390,
      height: 90,
    );
  }

  Widget _todayMealList() {
    return new SizedBox(
      child: new Container(
        height: 310,
        width: 400,
        child: new ListView(
          children: <Widget>[
            _getDailyMealCard(
                mealName: "Chicken Pasta",
                imageFile: "Assets/chicken_pasta.jpeg",
                currentPrice: 10,
                realPrice: 15),
            _getDailyMealCard(
                mealName: "Burito Chicken",
                imageFile: "Assets/burrito_chicken.jpg",
                currentPrice: 1.0,
                realPrice: 5.0),
            _getDailyMealCard(
                mealName: "Seafood Pizza",
                imageFile: "Assets/seafood_pizza.jpeg",
                currentPrice: 25,
                realPrice: 35),
            _getDailyMealCard(
                mealName: "Seafood Soup",
                imageFile: "Assets/seafood_soup.jpeg",
                currentPrice: 35,
                realPrice: 55),
          ],
        ),
      ),
    );
  }

  Widget _getWeeklyMealCard(
      {String mealName,
      String imageFile,
      double currentPrice,
      double realPrice}) {
    return new SizedBox(
      child: Container(
        child: new Card(
          child: new Row(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(left: 5)),
              new CircleAvatar(
                backgroundImage: AssetImage(imageFile),
                radius: 30,
              ),
              new SizedBox(
                width: 10,
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 15)),
                  new Text(
                    mealName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 5)),
                  new Text(
                    "${currentPrice} LE.",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3)),
                  new Text(
                    "${realPrice} LE.",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      width: 200,
    );
  }

  Widget _getDailyMealCard(
      {String mealName,
      String imageFile,
      double currentPrice,
      double realPrice}) {
    return new SizedBox(
      height: 150,
      child: new Card(
          child: Stack(
        children: <Widget>[
          Positioned(
            child: Image(
              image: AssetImage(imageFile),
              fit: BoxFit.cover,
            ),
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
          ),
          Positioned(
            bottom: 10,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  mealName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(padding: EdgeInsets.only(top: 10)),
                new Row(
                  children: <Widget>[
                    new Text(
                      "$currentPrice LE.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "$realPrice LE.",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _todayOffersTitles() {
    return new SizedBox(
      width: 390,
      child: new Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(width: 5, color: Colors.deepPurple))),
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _todayDateText(),
            new SizedBox(
              height: 5,
            ),
            _todayText(),
          ],
        ),
      ),
    );
  }

  Widget _todayDateText() {
    return new Container(
      padding: EdgeInsets.only(left: 0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "24 September 2019",
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _todayText() {
    return new Container(
      padding: EdgeInsets.only(left: 0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "TODAY",
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget signOutButton() {
    return new FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
        },
        child: new Text(
          "Sign Out",
          style: TextStyle(color: Colors.white),
        ));
  }
}
