
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: converter(),
        theme: ThemeData(
          primaryColor: Colors.pink,
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
        title: Text('TIME'),
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
  String dropdownValue1 = 'Second';
  String dropdownValue2 = 'weeks';
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
            items: <String>['Second','Millisecond','hours','weeks','days']
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
            items: <String>['Second','Millisecond','hours','weeks','days']
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

double mind(double v1, String s1, String s2) {
  //celsius to unit
  if (s1 == 'Millisecond') {
    if (s2 == 'Second') {
      double v = v1.toSecond(TimeUnit.millisecond);
      return v;
    }
    if (s2 == 'hours') {
      double v = v1
          .toSecond(TimeUnit.millisecond)
          .toHour;
      return v;
    }
    if (s2 == 'weeks') {
      double v = v1
          .toSecond(TimeUnit.millisecond)
          .toWeek;
      return v;
    }
    if (s2 == 'days') {
      double v = v1
          .toSecond(TimeUnit.millisecond)
          .toDay;
      return v;
    }
    if (s2 == 'Milliseconds') {
      double v = v1;
      return v;
    }
  }
  //hours to unit
  if (s1 == 'hours') {
    if (s2 == 'Second') {
      double v = v1.toSecond(TimeUnit.hour);
      return v;
    }
    if (s2 == 'hours') {
      double v = v1;
      return v;
    }
    if (s2 == 'weeks') {
      double v = v1
          .toSecond(TimeUnit.hour)
          .toWeek;
      return v;
    }
    if (s2 == 'days') {
      double v = v1
          .toSecond(TimeUnit.hour)
          .toDay;
      return v;
    }
    if (s2 == 'Milliseconds') {
      double v = v1
          .toSecond(TimeUnit.hour)
          .toMillisecond;
      return v;
    }
  }
//weeks to unit
  if (s1 == 'hours') {
    if (s2 == 'Second') {
      double v = v1.toSecond(TimeUnit.week);
      return v;
    }
    if (s2 == 'hours') {
      double v = v1
          .toSecond(TimeUnit.week)
          .toHour;
      return v;
    }
    if (s2 == 'weeks') {
      double v = v1;
      return v;
    }
    if (s2 == 'days') {
      double v = v1
          .toSecond(TimeUnit.week)
          .toDay;
      return v;
    }
    if (s2 == 'Milliseconds') {
      double v = v1
          .toSecond(TimeUnit.week)
          .toMillisecond;
      return v;
    }
  }
  //days to units
  if (s1 == 'days') {
    if (s2 == 'Second') {
      double v = v1.toSecond(TimeUnit.day);
      return v;
    }
    if (s2 == 'hours') {
      double v = v1
          .toSecond(TimeUnit.day)
          .toHour;
      return v;
    }
    if (s2 == 'weeks') {
      double v = v1
          .toSecond(TimeUnit.day)
          .toWeek;
      return v;
    }
    if (s2 == 'days') {
      double v = v1;
      return v;
    }
    if (s2 == 'Milliseconds') {
      double v = v1
          .toSecond(TimeUnit.day)
          .toMillisecond;
      return v;
    }
  }
  //seconds to units
  if (s1 == 'Second') {
    if (s2 == 'Second') {
      double v = v1;
      return v;
    }
    if (s2 == 'hours') {
      double v = v1
          .toSecond(TimeUnit.second)
          .toHour;
      return v;
    }
    if (s2 == 'weeks') {
      double v = v1
          .toSecond(TimeUnit.second)
          .toWeek;
      return v;
    }
    if (s2 == 'days') {
      double v = v1
          .toSecond(TimeUnit.second)
          .toDay;
      return v;
    }
    if (s2 == 'Milliseconds') {
      double v = v1
          .toSecond(TimeUnit.second)
          .toMillisecond;
      return v;
    }
  }
}