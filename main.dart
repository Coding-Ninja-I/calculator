import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum ;
  late int secondnum ;
  late String res;
  late String operator;
   String history ='';
  String text_to_display = "";

  void btnclicked (String btnval){
    if(btnval == "C")
      {
        text_to_display = "";
        firstnum = 0;
        secondnum = 0;
        res = "";
        history = "";
      }
    else if (btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/")
      {
        firstnum = int.parse(text_to_display);
        res = "";
        operator = btnval;
        history = firstnum.toString() + " " + operator.toString() ;
      }
    else if (btnval == "=")
      {
        secondnum = int.parse(text_to_display);
        if ( operator == "+")
          {
            res = (firstnum + secondnum).toString();
            history = firstnum.toString() + " " + operator.toString() + " " + secondnum.toString();
          }
        if ( operator == "-")
        {
          res = (firstnum - secondnum).toString();
          history = firstnum.toString() + " " + operator.toString() + " " + secondnum.toString();
        }
        if ( operator == "x")
        {
          res = (firstnum * secondnum).toString();
          history = firstnum.toString() + " " + operator.toString() + " " + secondnum.toString();
        }
        if ( operator == "/")
        {
          res = (firstnum ~/ secondnum).toString();
          history = firstnum.toString() + " " + operator.toString() + " " + secondnum.toString();
        }

      }
    else{
      res = int.parse(text_to_display + btnval).toString();
    }

    setState(()
        {
          text_to_display = res;
        });
  }

  Widget custombutton(String btnval, Color btncolor){
    return Expanded(

        child: RaisedButton(
          elevation: 15.0,
          onPressed: () => btnclicked(btnval),
          child: Text(btnval,style: TextStyle(fontSize: 25.0,color: Colors.white),),
          shape: const CircleBorder(),
          color: btncolor,
          padding: EdgeInsets.all(28.0),

        ),
    );
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('Calculator'),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              padding: EdgeInsets.only(top: 230.0,right: 10.0),
              alignment: Alignment.bottomRight,
              child: Text(history,style: TextStyle(fontSize: 25.0,color: Colors.black54),),
            ),
            Expanded(
                child:Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(text_to_display,style: TextStyle(fontSize: 45.0,color: Colors.black),),
                )
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                custombutton("9",Colors.black54),
                custombutton("8",Colors.black54),
                custombutton("7",Colors.black54),
                custombutton("+",Colors.amber.shade700),
              ],
            ),
            SizedBox(height: 2.0),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                custombutton("6",Colors.black54),
                custombutton("5",Colors.black54),
                custombutton("4",Colors.black54),
                custombutton("-",Colors.amber.shade700),
              ],
            ),
            SizedBox(height: 2.0),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                custombutton("3",Colors.black54),
                custombutton("2",Colors.black54),
                custombutton("1",Colors.black54),
                custombutton("x",Colors.amber.shade700),
              ],
            ),
            SizedBox(height: 2.0),
            Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                custombutton("C",Colors.teal.shade500),
                custombutton("0",Colors.teal.shade500),
                custombutton("=",Colors.teal.shade500),
                custombutton("/",Colors.amber.shade700),
              ],
            ),
            SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }


}