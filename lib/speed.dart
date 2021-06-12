import 'package:flutter/material.dart';

void main() => runApp(Speed());

class Speed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpeedConverter(),
    );
  }
}

class SpeedConverter extends StatefulWidget {
  @override
  _SpeedConverterState createState() => _SpeedConverterState();
}

class _SpeedConverterState extends State<SpeedConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> units = [
    'Speed of light(c)',
    'Kilometer/second(km/s)',
    'Mile/hour(mph)',
    'Mach(ma)',
    'Inch/second(in/s)',
    'Meter/second(m/s)',
    'Kilometer/hour(km/h)',
  ];

  final Map<String, int> unitsmap = {
    'Speed of light(c)': 0,
    'Kilometer/second(km/s)': 1,
    'Mile/hour(mph)': 2,
    'Mach(ma)': 3,
    'Inch/second(in/s)': 4,
    'Meter/second(m/s)': 5,
    'Kilometer/hour(km/h)': 6,
  };

  dynamic formulas = {
    '0': [
      1,
      299796.138933,
      670624775.1528960360488,
      880980.932965540325538,
      11802997661.59011871927089,
      299796138.6257345009633,
      1079266099.05264420194
    ],
    '1': [0.0000033356, 1, 2236.936, 2.9386, 39370.079, 1000, 3600],
    '2': [
      1.49114681884E-9,
      0.00044704005836555,
      1,
      0.0013136719155131300523,
      17.6000024140163147845,
      0.44704005836555,
      1.60934421011598
    ],
    '3': [
      0.000001135098,
      0.340298101136,
      761.22507310643888,
      1,
      13397.56312516892,
      340.29810113658,
      1225.0731640917443688
    ],
    '4': [
      8.472423944016E-11,
      0.0000259999836,
      0.056817402500004826,
      0.0000746403950737,
      1,
      0.02539999983236,
      0.09143999396496
    ],
    '5': [3.3356E-9, 0.001, 2.236936, 0.0029386, 39.370079, 1, 3.6],
    '6': [
      9.265555555556298E-10,
      0.0002777777777778,
      0.62137111111160828,
      0.00081627777784308,
      10.9361330555404462,
      0.27777777777778,
      1
    ],
  };

  void convert(double value, String from, String to) {
    int? unitfrom = unitsmap[from];
    int? unitto = unitsmap[to];

    var multi = formulas[unitfrom.toString()][unitto];
    var result = value * multi;
    if (result != 0)
      convertresult =
          // ignore: unnecessary_brace_in_string_interps
          '${userInput.toString()} ${_startunits} is equal to ${result.toStringAsFixed(5)}$_endunits';
    else {
      convertresult = 'Not perform conversion';
    }

    setState(() {
      convertresult = convertresult;
    });
  }

  double? userInput;
  String? _startunits;
  String? _endunits;
  String? convertresult;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'SPEED CONVERTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Speed Conversion',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  onChanged: (text) {
                    var input = double.tryParse(text);
                    if (input != null)
                      setState(() {
                        userInput = input;
                      });
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red[100],
                      hintText: 'Enter the input value to calculate',
                      hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      )),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'From Unit :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _startunits,
                            dropdownColor: Colors.white,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            hint: Text(
                              'choose a unit        ',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            items: units.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _startunits = value.toString();
                              });
                            },
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'To  Unit: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: _endunits,
                          dropdownColor: Colors.white,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          hint: Text(
                            'choose a unit              ',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          items: units.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _endunits = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: () {
                  if (_startunits!.isEmpty ||
                      _endunits!.isEmpty ||
                      userInput == 0)
                    return;
                  else {
                    convert(userInput!, _startunits!, _endunits!);
                  }
                },
                child: Container(
                  height: 70,
                  width: 200,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Lets Convert',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Text(
                  (convertresult == null) ? '' : convertresult!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
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
