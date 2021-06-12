import 'dart:async';

import 'package:calcicc/normalcal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:calcicc/unitconvert.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => First())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Calci C',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'calculator converter',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Navdraw(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'CALCI CONVERTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  height: 205,
                  width: 205,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 23),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'SIMPLE CALCULATOR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/jjj.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 90),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Unitpage()),
                    );
                  },
                  child: Container(
                      height: 205,
                      width: 205,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'UNIT CONVERTER',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/imge.png'),
                              radius: 50,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Navdraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(top: 140, left: 60),
            child: Text(
              'CALCI CONVERTER',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/header.png',
              ),
            )),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => First()),
              );
            },
            leading: Icon(
              FontAwesomeIcons.home,
              color: Colors.black,
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            leading: Icon(
              FontAwesomeIcons.infoCircle,
              color: Colors.black,
            ),
            title: Text(
              'ABOUT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Second()),
              );
            },
            leading: Icon(
              FontAwesomeIcons.dev,
              color: Colors.black,
            ),
            title: Text(
              'DEVELOPER',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Developers
class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'DEVELOPER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/456.jpg'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text.rich(TextSpan(
                      text: '" A beginning coder in ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Flutter , ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.red,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text:
                              'to build an apps for Android. A learning coder in ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'C language. "',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.normal,
                            color: Colors.red,
                          ),
                        ),
                      ]))),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () => launch(
                                'https://www.instagram.com/thamizh813813/'),
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              size: 44,
                              color: Colors.black,
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: IconButton(
                              onPressed: () =>
                                  launch('https://github.com/Thamizh813'),
                              icon: Icon(
                                FontAwesomeIcons.github,
                                size: 44,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => launch(
                              'https://www.linkedin.com/in/thamizh-arasan-b48746208'),
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            size: 44,
                            color: Colors.black,
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: IconButton(
                            onPressed: () => launch(
                                'https://api.whatsapp.com/send?phone= +919597164167&text=Hello Thamizharasan'),
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              size: 44,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        titleSpacing: 20,
        title: Text(
          'ABOUT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/calci.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/unit.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text(
                  'An electronic calculator is typically a portable electronic device used to perform calculations, ranging from basic arithmetic to complex mathematics. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 10),
                child: Text(
                  'A scientific calculator is a calculator designed to help you calculate science, engineering, and mathematics problems. It has way more buttons than your standard calculator that just lets you do your four basic arithmetic operations of addition, subtraction, multiplication, and division.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
                child: Text(
                  'A unit is a measurement of a quantity that is defined or adopted by tradition or law. Other quantities can be expressed as a multiple of the unit.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
