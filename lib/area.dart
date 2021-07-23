import 'package:calcicc/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(Area());

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AreaConverter(),
    );
  }
}

class AreaConverter extends StatefulWidget {
  @override
  _AreaConverterState createState() => _AreaConverterState();
}

class _AreaConverterState extends State<AreaConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> units = [
    'Square meter(m2)',
    'Square decimeter(dm2)',
    'Square centimeter(cm2)',
    'Square kilometer(km2)',
    'Square millimeter(mm2)',
    'Are(ar)',
    'Hectare(ha)',
    'Square mile(mi2)',
    'Square rod(rd2)',
    'Square yard(yd2)',
    'Square foot(ft2)',
    'Acre(ac)',
    'Square inch(inch2)',
  ];

  final Map<String, int> unitsmap = {
    'Square meter(m2)': 0,
    'Square decimeter(dm2)': 1,
    'Square centimeter(cm2)': 2,
    'Square kilometer(km2)': 3,
    'Square millimeter(mm2)': 4,
    'Are(ar)': 5,
    'Hectare(ha)': 6,
    'Square mile(mi2)': 7,
    'Square rod(rd2)': 8,
    'Square yard(yd2)': 9,
    'Square foot(ft2)': 10,
    'Acre(ac)': 11,
    'Square inch(inch2)': 12,
  };

  dynamic formulas = {
    '0': [
      1,
      100,
      10000,
      0.000001,
      1000000,
      0.01,
      0.0001,
      3.861E-7,
      0.0395369,
      1.19599,
      10.7639104,
      0.0002471,
      1550.0031
    ],
    '1': [
      0.01,
      1,
      100,
      1E-8,
      10000,
      0.0001,
      0.000001,
      3.861E-9,
      0.000395369,
      0.0119599,
      0.107639104,
      0.000002431,
      15.500031
    ],
    '2': [
      0.0001,
      0.01,
      1,
      1E-10,
      100,
      0.000001,
      1E-8,
      3.861E-11,
      0.00000395369,
      0.000119599,
      0.00107639104,
      2.471E-8,
      0.15500031
    ],
    '3': [
      1000000,
      100000000,
      10000000000,
      1,
      1000000000000,
      10000,
      100,
      0.3861,
      39536.9,
      1195990,
      10763910.4,
      247.1,
      1550003100
    ],
    '4': [
      0.000001,
      0.0001,
      0.01,
      1E-12,
      1,
      1E-8,
      1E-10,
      3.681E-13,
      3.95369E-8,
      0.00000119599,
      0.000010763104,
      2.471E-10,
      0.0015500031
    ],
    '5': [
      100,
      10000,
      1000000,
      0.0001,
      100000000,
      1,
      0.01,
      0.00003861,
      3.95369,
      119.599,
      1076.39104,
      0.02471,
      155000.31
    ],
    '6': [
      10000,
      1000000,
      100000000,
      0.01,
      10000000000,
      100,
      1,
      0.003861,
      359.369,
      11959.9,
      107639.104,
      2.471,
      15500031
    ],
    '7': [
      2590002.590000256,
      259000259.000259000259,
      25900025900.0259000259,
      2.59000259000259000,
      2590002590002.59000259,
      25,
      900.025900,
      259.000259000259000,
      1,
      102400.673400,
      3097617.19761,
      27878555.814555,
      639.98963989,
      4014512043.5120
    ],
    '8': [
      25.2928,
      2529.28277,
      252928.27771,
      0.0000252982,
      25292827.712845,
      0.252928,
      0.00252981,
      0.00000976555,
      1,
      30.2499690,
      272.24973,
      0.0062498,
      39203.96136
    ],
    '9': [
      0.83612,
      83.6127,
      8361.273,
      8.36127,
      836127.3924,
      0.0083612,
      0.0000836127,
      3.22828876,
      0.033057885,
      1,
      9.000000334,
      0.000206670,
      1296.000050176
    ],
    '10': [
      0.09290,
      9.29030,
      929.030,
      9.290301E-8,
      92903.0401,
      0.0009290130,
      0.00000929030,
      3.5861E-8,
      0.00367308,
      0.11111111069,
      1,
      0.0000022956,
      144.0000002229
    ],
    '11': [
      4046.94455,
      404494.4556,
      40469445.5685,
      0.004069645,
      4046944556.855,
      40.469445,
      0.40469445,
      0.00156255,
      160.00364,
      4840.10522,
      43560.9486,
      1,
      6272276.60866
    ],
    '12': [
      0.00064516,
      0.0645160,
      6.4516,
      6.4516003E-10,
      645.16003,
      0.0000064516,
      6.4516000003E-8,
      2.490761115483E-10,
      0.000025507,
      0.000771604,
      0.0069444333,
      1.594143E-7,
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
          'AREA CONVERTER',
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
                  'Area Conversion',
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
