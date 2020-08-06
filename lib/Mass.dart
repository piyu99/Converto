
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class Mass extends StatefulWidget {
  @override
  _MassState createState() => _MassState();
}

class _MassState extends State<Mass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: converter(),
        theme: ThemeData(
          primaryColor: Colors.brown,
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
        title: Text('MASS'),
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
  String dropdownValue1 = 'Gram';
  String dropdownValue2 = 'Pounds';
  final number = TextEditingController();
  double out;
 double u = 2000.toSecond(TimeUnit.millisecond);

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
            items: <String>['Gram','Milligram','Kilogram','Ounce','Tonnes','Pounds']
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
            items: <String>['Gram','Milligram','Kilogram','Ounce','Tonnes','Pounds']
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
  //gram to unit
  if (s1 == 'Gram') {
    if (s2 == 'Milligram') {
      double v = v1
          .toKilogram(MassUnit.gram)
          .toMilligram;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1
          .toKilogram(MassUnit.gram)
          .toOunce;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1
          .toKilogram(MassUnit.gram)
          .toTonnes;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1
          .toKilogram(MassUnit.gram)
          .toPound;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1/1000;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1;
      return v;
    }
  }
//mg to unit
  if (s1 == 'Milligram') {
    if (s2 == 'Milligram') {
      double v=v1;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1
          .toKilogram(MassUnit.milligram)
          .toOunce;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1
          .toKilogram(MassUnit.milligram)
          .toTonnes;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1
          .toKilogram(MassUnit.milligram)
          .toPound;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1/1000000;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1
          .toKilogram(MassUnit.milligram)
          .toGram;
      return v;
    }
  }
  //pounds to units
  if (s1 == 'Pounds') {
    if (s2 == 'Milligram') {
      double v = v1
          .toKilogram(MassUnit.pound)
          .toMilligram;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1
          .toKilogram(MassUnit.pound)
          .toOunce;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1
          .toKilogram(MassUnit.pound)
          .toTonnes;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1*0.4535;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1
          .toKilogram(MassUnit.pound)
          .toGram;
      return v;
    }
  }
  //ounce to unit
  if (s1 == 'Ounce') {
    if (s2 == 'Milligram') {
      double v = v1
          .toKilogram(MassUnit.ounce)
          .toMilligram;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1
          .toKilogram(MassUnit.ounce)
          .toTonnes;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1
          .toKilogram(MassUnit.ounce)
          .toPound;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1*0.0283;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1
          .toKilogram(MassUnit.ounce)
          .toGram;
      return v;
    }
  }
  //tonnes to unit
  if (s1 == 'Tonnes') {
    if (s2 == 'Milligram') {
      double v = v1
          .toKilogram(MassUnit.tonnes)
          .toMilligram;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1
          .toKilogram(MassUnit.tonnes)
          .toOunce;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1
          .toKilogram(MassUnit.tonnes)
          .toPound;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1*1000;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1
          .toKilogram(MassUnit.tonnes)
          .toGram;
      return v;
    }
  }
  //kilo to units
  if (s1 == 'Kilogram') {
    if (s2 == 'Milligram') {
      double v = v1*1000000;
      return v;
    }
    if (s2 == 'Ounce') {
      double v = v1*35.27;
      return v;
    }
    if (s2 == 'Tonnes') {
      double v = v1/1000;
      return v;
    }
    if (s2 == 'Pounds') {
      double v = v1*2.204;
      return v;
    }
    if (s2 == 'Kilogram') {
      double v = v1;
      return v;
    }
    if (s2 == 'Gram') {
      double v = v1/1000;
      return v;
    }
  }
}