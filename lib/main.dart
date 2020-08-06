
import 'package:task_02_category_widget/js.dart';
import 'package:flutter/material.dart';
import 'package:task_02_category_widget/category.dart';
import 'package:task_02_category_widget/temp.dart';
import 'package:task_02_category_widget/time.dart';
import 'length.dart';
import 'temp.dart';
import 'Mass.dart';
import 'time.dart';


void main() {
  runApp(UnitConverterApp(
  ));
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: page1(),
      
    );
  }
}

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text('UNIT CONVERTER')),
      ) ,

      body: ListView(
        children: <Widget>[
          FlatButton(child: x(c1.col,c1.text,c1.ico),onPressed: (){
              Navigator.of(context).push( MaterialPageRoute(builder: (context) => Length()),);
            },),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          FlatButton(child: x(c2.col,c2.text,c2.ico),onPressed: (){
           Navigator.of(context).push( MaterialPageRoute(builder: (context) => Mass()),);
          },),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          FlatButton(child: x(c3.col,c3.text,c3.ico),onPressed: (){
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => Temp()),);
          },),
          Divider(
            color: Theme.of(context).dividerColor,
          ),
          FlatButton(child: x(c4.col,c4.text,c4.ico),onPressed: (){
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => Time()),);
          },),
//          Divider(
//            color: Theme.of(context).dividerColor,
//          ),
//          x(c5.col,c5.text,c5.ico),

        ],
      ),
    );
  }
}

Catag c1=Catag(c:Colors.red,t: 'LENGTH', i: Icons.ac_unit);
Catag c2=Catag(c:Colors.blue,t: 'MASS', i: Icons.ac_unit);
Catag c3=Catag(c:Colors.yellow,t: 'TEMPERATURE', i: Icons.ac_unit);
Catag c4=Catag(c:Colors.purple,t: 'TIME', i: Icons.ac_unit);
Catag c5=Catag(c:Colors.blueGrey,t: 'CURRENCY', i: Icons.ac_unit);

ListTile x(Color o,String y,IconData z){
  return  ListTile(
      title: Text(y),
      leading: Icon(z),

  );
}


