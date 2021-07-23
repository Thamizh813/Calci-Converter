import 'package:calcicc/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(Length());

class Length extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LengthConverter(),
    );
  }
}

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> units = [
    'Decimeter(dm)',
    'Light Year(ly)',
    'millimeter(mm)',
    'kilometer(km)',
    'Centimeter(cm)',
    'Meter(m)',
    'Micrometer(μm)',
    'Astronomical unit(AU)',
    'Picometer(pm)',
    'Nanometer(nm)',
    'Yard(yd)',
    'Foot(ft)',
    'Mile(mi)',
    'inch(in)',
  ];

  final Map<String, int> unitsmap = {
    'Decimeter(dm)': 0,
    'Light Year(ly)': 1,
    'millimeter(mm)': 2,
    'kilometer(km)': 3,
    'Centimeter(cm)': 4,
    'Meter(m)': 5,
    'Micrometer(μm)': 6,
    'Astronomical unit(AU)': 7,
    'Picometer(pm)': 8,
    'Nanometer(nm)': 9,
    'Yard(yd)': 10,
    'Foot(ft)': 11,
    'Mile(mi)': 12,
    'inch(in)': 13,
  };

  dynamic formulas = {
    '0': [
      1,
      1.057E-17,
      100,
      0.0001,
      10,
      0.1,
      100000,
      6.6946E-13,
      100000000000,
      100000000,
      0.10936133,
      0.3280830,
      0.00006214,
      3.937007
    ],
    '1': [
      94607379375591296.12109,
      1,
      9460737937559129612.1097,
      9460737937559.1296,
      946073793755912961.21097,
      9460737937559129.6121097,
      9460737937559129612109.7445,
      63241.24881,
      9460737937559129612109744560.076,
      9460737937559129612109744.560076,
      10346388836329233.68022,
      31039166508987701.0406,
      5878902554399.243140496,
      372469997161778618.73226
    ],
    '2': [
      0.01,
      1.057E-19,
      1,
      0.000001,
      0.1,
      0.001,
      1000,
      6.6846E-15,
      1000000000,
      1000000,
      0.0010109,
      0.0032808,
      6.214E-7,
      0.03937007
    ],
    '3': [
      10000,
      1.057E-13,
      1000000,
      1,
      100000,
      1000,
      1000000000,
      606846E-9,
      1000000000000000,
      1000000000000,
      1093.6133,
      3280.8399,
      0.6214,
      39370.0787
    ],
    '4': [
      0.1,
      1.057E-18,
      10,
      0.00001,
      1,
      0.01,
      10000,
      6.6846E-14,
      10000000000,
      10000000,
      0.01093,
      0.03280,
      0.000006214,
      0.3937
    ],
    '5': [
      10,
      1.057E-16,
      1000,
      0.001,
      100,
      1,
      1000000,
      6.6846E-12,
      1000000000000,
      1000000000,
      1.0936133,
      3.28083,
      0.0006214,
      39.3700787
    ],
    '6': [
      0.0001,
      1.057E-22,
      0.001,
      1E-9,
      0.0001,
      0.000001,
      1,
      6.6846E-18,
      1000000,
      1000,
      0.000001093,
      0.0000032808,
      6.214E-10,
      0.00003937
    ],
    '7': [
      1495975825030.6675044,
      0.0000158124464,
      149597582503006.75044,
      149597582.5030667,
      14959758250306.675044,
      149597582503.0067504,
      149597582503006750.44134,
      1,
      149597582503066750441312.868,
      149597582503066750441.312,
      163601905873.20108,
      490805717619.60326,
      92959937.76740,
      5889668596475.48095266
    ],
    '8': [
      1E-11,
      1.057E-28,
      1E-9,
      1E-15,
      1E-10,
      1E-12,
      0.000001,
      6.6846E-24,
      1,
      0.001,
      1.09361E-12,
      3.28088399E-12,
      6.214E-16,
      3.937007E-11
    ],
    '9': [
      1E-8,
      1.057E-25,
      0.000001,
      1E-12,
      1E-7,
      1E-9,
      0.001,
      6.6846E-21,
      1000,
      1,
      1.09361E-9,
      3.2808399E-9,
      6.214E-13,
      3.93700787E-8
    ],
    '10': [
      9.143999986,
      9.6652079853E-17,
      914.3999,
      0.000914999,
      91.4399986,
      0.9143999986,
      914399.9986,
      6.112398E-12,
      914399998610.112,
      914399998.610112,
      1,
      2.99999999999999930688,
      0.00056828,
      35.9999999085
    ],
    '11': [
      3.04799953,
      3.221735E-17,
      304.7999953,
      0.000030479999953,
      30.479999953,
      0.304479999953,
      304799.999536704,
      2.037666067E-12,
      304799999536.704,
      304799999.536704,
      0.3333333333333333335632,
      1,
      0.0001894027,
      11.9999999999695
    ],
    '12': [
      16092.6939,
      1.700099774E-13,
      1609269.39169616,
      1.60926939169616,
      160926.93169,
      1609.26939169616,
      1609269391.69616,
      1.075732294E-8,
      1609269391696169.939,
      1609269391696.1699,
      1759.91841,
      5279.7552301255,
      1,
      63357.06266005
    ],
    '13': [
      0.254000025,
      2.6847800056E-18,
      25.400000025908,
      0.00002540000025908,
      2.5400000025908,
      0.02540000025908,
      25400.000025908,
      1.69788840168E-13,
      25400000025.905,
      25400000.025905,
      0.0277777784,
      0.08333333355,
      0.00001578356,
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
          'LENGTH CONVERTER',
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
                  'Length Conversion',
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 9),
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
                              'choose a unit',
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 9),
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
                            'choose a unit',
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
