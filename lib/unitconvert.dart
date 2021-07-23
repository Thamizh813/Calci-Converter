import 'package:calcicc/area.dart';
import 'package:calcicc/length.dart';
import 'package:calcicc/main.dart';
import 'package:calcicc/power.dart';
import 'package:calcicc/speed.dart';
import 'package:calcicc/tem.dart';
import 'package:calcicc/volume.dart';
import 'package:calcicc/weight.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(Scienpage());
}

class Scienpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Unitpage(),
    );
  }
}

class Unitpage extends StatefulWidget {
  @override
  _UnitpageState createState() => _UnitpageState();
}

class _UnitpageState extends State<Unitpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          titleSpacing: 20,
          title: Text(
            'UNIT CONVERTERS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        drawer: Navdraw(),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 34, top: 40),
            child: Row(children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeightConverter()));
                },
                child: SizedBox(
                  child: Column(children: [
                    Icon(
                      FontAwesomeIcons.weightHanging,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Weight ',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LengthConverter()));
                  },
                  child: SizedBox(
                    child: Column(children: [
                      Icon(
                        Icons.line_weight,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Length ',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 34, top: 40),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AreaConverter()),
                    );
                  },
                  child: SizedBox(
                    child: Column(children: [
                      Icon(
                        FontAwesomeIcons.square,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          'Area  ',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolumeConverter()));
                    },
                    child: SizedBox(
                      child: Column(children: [
                        Icon(
                          FontAwesomeIcons.cube,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Volume',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 34, top: 40),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpeedConverter()));
                  },
                  child: SizedBox(
                    child: Column(children: [
                      Icon(
                        FontAwesomeIcons.tachometerAlt,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Speed  ',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TempConverter()));
                    },
                    child: SizedBox(
                      child: Column(children: [
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 5),
                          child: Text(
                            'Temp   ',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 120, top: 40),
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PowerConverter()));
                    },
                    child: SizedBox(
                      child: Column(children: [
                        Icon(
                          Icons.power,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 4),
                          child: Text(
                            'Power  ',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              )),
        ]));
  }
}
