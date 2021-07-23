import 'package:calcicc/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(Volume());

class Volume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VolumeConverter(),
    );
  }
}

class VolumeConverter extends StatefulWidget {
  @override
  _VolumeConverterState createState() => _VolumeConverterState();
}

class _VolumeConverterState extends State<VolumeConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> units = [
    'Hectolitre(hl)',
    'Cubic meter(m3)',
    'Cubic centimeter(cm3)',
    'Deciliter(dl)',
    'Centiliter(cl)',
    'Cubic decimeter(dm3)',
    'Liter(l)',
    'Cubic millimeter(mm3)',
    'Milliliter(ml)',
    'Cubic foot(ft3)',
    'Cubic yard(yd3)',
    'Cubic inch(inch3)',
  ];

  final Map<String, int> unitsmap = {
    'Hectolitre(hl)': 0,
    'Cubic meter(m3)': 1,
    'Cubic centimeter(cm3)': 2,
    'Deciliter(dl)': 3,
    'Centiliter(cl)': 4,
    'Cubic decimeter(dm3)': 5,
    'Liter(l)': 6,
    'Cubic millimeter(mm3)': 7,
    'Milliliter(ml)': 8,
    'Cubic foot(ft3)': 9,
    'Cubic yard(yd3)': 10,
    'Cubic inch(inch3)': 11,
  };

  dynamic formulas = {
    '0': [
      1,
      0.1,
      100000,
      1000,
      10000,
      100,
      100,
      100000000,
      100000,
      3.53147248,
      0.13079528,
      6102.38445022
    ],
    '1': [
      10,
      1,
      1000000,
      10000,
      100000,
      1000,
      1000,
      1000000000,
      1000000,
      35.3147248,
      1.3079528,
      61023.8445022
    ],
    '2': [
      0.00001,
      0.000001,
      1,
      0.01,
      0.1,
      0.001,
      0.001,
      1000,
      1,
      0.00003514748,
      0.0000013079528,
      0.0610238445022
    ],
    '3': [
      0.001,
      0.0001,
      100,
      1,
      10,
      0.1,
      0.1,
      100000,
      100,
      0.00353147248,
      0.00013079528,
      6.10238445022
    ],
    '4': [
      0.0001,
      0.00001,
      10,
      0.1,
      1,
      0.01,
      0.01,
      10000,
      10,
      0.000353147248,
      0.000013079528,
      0.610238445022
    ],
    '5': [
      0.01,
      0.001,
      1000,
      10,
      100,
      1,
      1,
      1000000,
      1000,
      0.0353147248,
      0.0013079528,
      61.0238445022
    ],
    '6': [
      0.01,
      0.001,
      1000,
      10,
      100,
      1,
      1,
      1000000,
      1000,
      0.0353142748,
      0.0013079528,
      61.0238445022
    ],
    '7': [
      1E-8,
      1E-9,
      0.001,
      0.00001,
      0.0001,
      0.000001,
      0.000001,
      1,
      0.001,
      3.531472E-8,
      1.3079528E-9,
      0.0000610238445022
    ],
    '8': [
      0.00001,
      0.000001,
      1,
      0.01,
      0.1,
      0.001,
      0.001,
      1000,
      1,
      0.0000353147248,
      0.0000013079528,
      0.0610238445022
    ],
    '9': [
      0.28316800022182,
      0.028316800022182,
      28316.800022182,
      283.16800022182,
      2831.6800022182,
      28.316800022182,
      28.316800022182,
      28316800.022182,
      28316.800022182,
      1,
      0.0370370370096,
      1728.000001353578
    ],
    '10': [
      7.6455358329152,
      0.76455358329152,
      764553.58329152,
      7645.5358329152,
      76455.358329152,
      764.55358329152,
      764.55358329152,
      764553583.29152,
      764553.58329152,
      26.999999288353696,
      1,
      46655.99897626
    ],
    '11': [
      0.00016387037,
      0.000016387037,
      16.38703737,
      0.16387037037,
      1.6387037037,
      0.016387037037,
      0.016387037037,
      16387.037037,
      16.38707373,
      0.0005787037032,
      0.0000214334770536,
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
          'VOLUME CONVERTER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      drawer: Navdraw(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Volume Conversion',
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.only(left: 28),
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
                    padding: EdgeInsets.symmetric(horizontal: 21),
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
