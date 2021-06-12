import 'package:flutter/material.dart';

void main() => runApp(Power());

class Power extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PowerConverter(),
    );
  }
}

class PowerConverter extends StatefulWidget {
  @override
  _PowerConverterState createState() => _PowerConverterState();
}

class _PowerConverterState extends State<PowerConverter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  final List<String> units = [
    'Joule/second(J/s)',
    'Metric horsepower(PS)',
    'Kilogram-meter/second(kgm/s)',
    'Kilocalorie/second(kcal/s)',
    'Watt(W)',
    'Imperical horsepower(hp)',
    'Foot-pound/second(ftlb/s)',
    'Newton-meter/second(Nm/s)',
    'Kilowatt(kW)',
  ];

  final Map<String, int> unitsmap = {
    'Joule/second(J/s)': 0,
    'Metric horsepower(PS)': 1,
    'Kilogram-meter/second(kgm/s)': 2,
    'Kilocalorie/second(kcal/s)': 3,
    'Watt(W)': 4,
    'Imperical horsepower(hp)': 5,
    'Foot-pound/second(ftlb/s)': 6,
    'Newton-meter/second(Nm/s)': 7,
    'Kilowatt(kW)': 8,
  };

  dynamic formulas = {
    '0': [
      1,
      0.0013596216,
      0.1019716213,
      0.000239,
      1,
      0.0013410221,
      0.7375621489,
      1,
      0.001
    ],
    '1': [
      735.498759360,
      1,
      75.000000956147920,
      0.17578420348769,
      735.49875936069271,
      0.98630009088891,
      542.4760467501645719,
      735.498759360,
      0.7354987593271
    ],
    '2': [
      9.80664999787735,
      0.013333331639991076,
      1,
      0.002343898665,
      9.806649999787735,
      0.0131509376680435,
      7.2330138473537415,
      9.806649999787735,
      0.00980664999787735
    ],
    '3': [
      4184.1004184001841,
      5.68879330543656,
      426.6595033472,
      1,
      4184.10041841001841,
      5.610971126561,
      3086.063401249,
      4184.100418410041841,
      4.1841008410041841
    ],
    '4': [
      1,
      0.0013596216,
      0.1019716213,
      0.000239,
      1,
      0.0013410221,
      0.7375621489,
      1,
      0.001
    ],
    '5': [
      745.699865395153,
      1.0138696541048,
      76.04022185015589,
      0.178222678441567,
      745.699865736153,
      1,
      549.999995482022817,
      745.69986965153,
      0.7456998657153
    ],
    '6': [
      1.355817949024096,
      0.0018433993655696,
      0.1382544410400978,
      0.00032040402534,
      1.35581794924906,
      0.001818332190274226,
      1,
      1.35581794024906,
      0.001355811794906
    ],
    '7': [
      1,
      0.0013596216,
      0.1019716213,
      0.000239,
      1,
      0.001310221,
      0.737621489,
      1,
      0.001
    ],
    '8': [
      1000,
      1.3596216,
      101.971623,
      0.263,
      1000,
      1.3410221,
      737.5621489,
      1000,
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
          'POWER CONVERTER',
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
                  'Power Conversion',
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(children: [
                      Text(
                        'From ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Unit: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                    padding: const EdgeInsets.only(left: 2),
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
                    padding: EdgeInsets.symmetric(horizontal: 5),
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
