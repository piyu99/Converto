
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: converter(),
        theme: ThemeData(
          primaryColor: Colors.redAccent,
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
        title: Text('TEMPERATURE'),
        backgroundColor: Theme.of(context).primaryColor,
        leading: FlatButton(
          child: Icon(
              Icons.arrow_back,
            color: Colors.white,
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
  String dropdownValue1 = 'Celsius';
  String dropdownValue2 = 'Kelvin';
  final number = TextEditingController();
  double out;
// double u = 36.toKelvin(TemperatureUnit.celsius).toFahrenheit;

  String s;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                items: <String>['Celsius','Kelvin','Fahrenheit']
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
                items: <String>['Celsius','Kelvin','Fahrenheit']
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

      ,
    );
  }
}

double mind(double v1, String s1, String s2){
  //celsius to unit
  if(s1=='Celsius') {
    if (s2 == 'Kelvin') {
      double v = v1 + 273.15;
      return v;
    }
    if (s2 == 'Fahrenheit') {
      double v = v1
          .toKelvin(TemperatureUnit.celsius)
          .toFahrenheit;
      return v;
    }
    if (s2 == 'Celsius') {
      double v = v1;
      return v;
    }
  }
//fah to units
  if(s1=='Fahrenheit') {
    if (s2 == 'Kelvin') {
      double v2 = (v1-32)*0.55;
      double v=v2+273.15;
      return v;
    }
    if (s2 == 'Fahrenheit') {
      double v = v1;
      return v;
    }
    if (s2 == 'Celsius') {
      double v = v1
          .toKelvin(TemperatureUnit.fahrenheit)
          .toCelsius;
      return v;
    }
  }
  //kelvin to units
  if(s1=='Kelvin') {
    if (s2 == 'Kelvin') {
      double v = v1;
      return v;
    }
    if (s2 == 'Fahrenheit') {
      double v = v1.toKelvin(TemperatureUnit.fahrenheit);
      return v;
    }
    if (s2 == 'Celsius') {
      double v = v1
          .toKelvin(TemperatureUnit.celsius);
      return v;
    }
  }
}