import 'dart:ffi';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class Length extends StatefulWidget {
  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<Length> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: converter(),
        theme: ThemeData(
            primaryColor: Colors.deepOrange,
           // primaryColorLight: Color(0xffC8E6C9),
           // scaffoldBackgroundColor: Color(0xffC8E6C9),

           // dividerColor: Color(0xffBDBDBD)
        )

    );
  }
}

class converter extends StatefulWidget {
  @override
  _converterState createState() => _converterState();
}

class _converterState extends State<converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LENGTH'),
        backgroundColor: Theme.of(context).primaryColor,
        leading: FlatButton(
          child: Icon(
              Icons.arrow_back,
              color: Colors.white
          ),
          onPressed: (){
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => UnitConverterApp()),
            );
          },
        ),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropdownValue1 = 'M';
  String dropdownValue2 = 'KM';
  final number = TextEditingController();
  double out;
 //double u = 36.toKelvin(TemperatureUnit.celsius).toFahrenheit;

  String s;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('Enter Value',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30
              ),),

              width: 300,
              height: 40,

            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                hintText: 'Enter ',
               ),
              keyboardType: TextInputType.number,
              controller: number,

            ),


            DropdownButton(
              value: dropdownValue1,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Theme.of(context).primaryColor
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue1 = newValue;
                });
              },
              items: <String>['MM', 'CM', 'M', 'KM','Inch','Foot','Mile','Yard']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            RaisedButton(
              child: Text('Convert',style: TextStyle(color: Colors.white),),
              onPressed: (){
               // print(v);
                setState(() {
                  s=number.text;
                  var myDouble = double.parse(s);

                  out = mind(myDouble,dropdownValue1,dropdownValue2);
                });
              },
              color: Theme.of(context).primaryColor,
            ),
            DropdownButton(
              value: dropdownValue2,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Theme.of(context).primaryColor
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue2 = newValue;
                });
              },
              items: <String>['MM', 'CM', 'M', 'KM','Inch','Foot','Mile','Yard']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                hintText: 'Enter ',
                labelText: out.toString(),

              ),
            ),

          ],
    )

      );
  }
}

double mind(double v1, String s1, String s2){
  //meter to unit
if(s1=='M') {
  if (s2 == 'CM') {
    double v = v1.toMeter(LengthUnit.centimeter);
    return v;
  }
  if (s2 == 'KM') {
    double v = v1.toMeter(LengthUnit.millimeter);
    return v;
  }
  if (s2 == 'MM') {
    double v = v1.toMeter(LengthUnit.kilometer);
    return v;
  }
  if (s2 == 'M') {
    double v = v1;
    return v;
  }
  if (s2 == 'Inch') {
    double v = v1
        .toMeter(LengthUnit.meter).toInch;
    return v;
  }
  if (s2 == 'Foot') {
    double v = v1
        .toMeter(LengthUnit.meter)
        .toFoot;
    return v;
  }
  if (s2 == 'Mile') {
    double v = v1
        .toMeter(LengthUnit.meter)
        .toMile;
    return v;
  }
  if (s2 == 'Yard') {
    double v = v1
        .toMeter(LengthUnit.meter)
        .toYard;
    return v;
  }
}
  //milimeter to unit
if(s1=='MM') {
  if (s2 == 'CM') {
    double v = v1.toMeter(LengthUnit.millimeter).toCentimeter;
    return v;
  }
  if (s2 == 'KM') {
    double v = v1.toMeter(LengthUnit.millimeter).toKilometer;
    return v;
  }
  if (s2 == 'MM') {
    double v=v1;
    return v;
  }
  if (s2 == 'M') {
   double v = v1/1000;
   // return v;
  }
  if (s2 == 'Inch') {
    double v = v1.toMeter(LengthUnit.millimeter).toInch;
    return v;
  }
  if (s2 == 'Foot') {
    double v = v1.toMeter(LengthUnit.millimeter).toFoot;
    return v;
  }
  if (s2 == 'Mile') {
    double v = v1.toMeter(LengthUnit.millimeter).toMile;
    return v;
  }
  if (s2 == 'Yard') {
    double v = v1.toMeter(LengthUnit.millimeter).toYard;
    return v;
  }
}
//cm to units
  if(s1=='CM') {
    if (s2 == 'CM') {
      double v = v1;
      return v;
    }
    if (s2 == 'KM') {
      double v = v1.toMeter(LengthUnit.centimeter).toKilometer;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.centimeter).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v = v1/100;
      // return v;
    }
    if (s2 == 'Inch') {
      double v = v1.toMeter(LengthUnit.centimeter).toInch;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.centimeter).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1.toMeter(LengthUnit.centimeter).toMile;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1.toMeter(LengthUnit.centimeter).toYard;
      return v;
    }
  }
  //km to units
  if(s1=='KM') {
    if (s2 == 'CM') {
      double v=v1.toMeter(LengthUnit.kilometer).toCentimeter;
      return v;
    }
    if (s2 == 'KM') {
      double v = v1;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.kilometer).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v = v1/1000;
      // return v;
    }
    if (s2 == 'Inch') {
      double v = v1.toMeter(LengthUnit.kilometer).toInch;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.kilometer).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1.toMeter(LengthUnit.kilometer).toMile;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1.toMeter(LengthUnit.kilometer).toYard;
      return v;
    }
  }
  //Inch to units
  if(s1=='Inch') {
    if (s2 == 'CM') {
      double v=v1.toMeter(LengthUnit.inch).toCentimeter;
      return v;
    }
    if (s2 == 'KM') {
      double v=v1.toMeter(LengthUnit.inch).toKilometer;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.inch).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v=v1*(0.254);
       return v;
    }
    if (s2 == 'Inch') {
      double v = v1;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.inch).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1.toMeter(LengthUnit.inch).toMile;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1.toMeter(LengthUnit.inch).toYard;
      return v;
    }
  }
  //Foot to units
  if(s1=='Foot') {
    if (s2 == 'CM') {
      double v=v1.toMeter(LengthUnit.foot).toCentimeter;
      return v;
    }
    if (s2 == 'KM') {
      double v=v1.toMeter(LengthUnit.foot).toKilometer;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.foot).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v=v1*(0.3048);//
      return v;
    }
    if (s2 == 'Inch') {
      double v=v1.toMeter(LengthUnit.foot).toInch;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.foot).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1.toMeter(LengthUnit.foot).toMile;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1.toMeter(LengthUnit.foot).toYard;
      return v;
    }
  }
  //Mile t units
  if(s1=='Mile') {
    if (s2 == 'CM') {
      double v=v1.toMeter(LengthUnit.mile).toCentimeter;
      return v;
    }
    if (s2 == 'KM') {
      double v=v1.toMeter(LengthUnit.mile).toKilometer;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.mile).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v=v1*(1609.34);//
      return v;
    }
    if (s2 == 'Inch') {
      double v=v1.toMeter(LengthUnit.mile).toInch;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.mile).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1.toMeter(LengthUnit.mile).toYard;
      return v;
    }
  }
  //Yard to units
  if(s1=='Yard') {
    if (s2 == 'CM') {
      double v=v1.toMeter(LengthUnit.yard).toCentimeter;
      return v;
    }
    if (s2 == 'KM') {
      double v=v1.toMeter(LengthUnit.yard).toKilometer;
      return v;
    }
    if (s2 == 'MM') {
      double v=v1.toMeter(LengthUnit.yard).toMillimeter;
      return v;
    }
    if (s2 == 'M') {
      double v=v1*(0.9144);//
      return v;
    }
    if (s2 == 'Inch') {
      double v=v1.toMeter(LengthUnit.yard).toInch;
      return v;
    }
    if (s2 == 'Foot') {
      double v = v1.toMeter(LengthUnit.yard).toFoot;
      return v;
    }
    if (s2 == 'Mile') {
      double v = v1.toMeter(LengthUnit.yard).toMile;
      return v;
    }
    if (s2 == 'Yard') {
      double v = v1;
      return v;
    }
  }
}