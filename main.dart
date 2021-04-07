import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(Coffee());
}
class Coffee extends StatefulWidget {
  @override
  _CoffeeState createState() => _CoffeeState();
}

class _CoffeeState extends State<Coffee> {

  bool chkbx = false;
  bool chkbx1 = false;
  bool pee = true;
  bool pie = true;
    int alpha = 0 ;
    int beta ;
    int gamma;
    var controller1;
   var controller2 = new TextEditingController();
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coffee app'),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Column(
          children: [
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                labelText: ('Name'),
                labelStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
              child: Text('Toppings',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 0),
              child: CheckboxListTile(
                  title: Text('brownie'),
                  value: chkbx ,
                  onChanged: (isChecked){
                setState(() {
                  chkbx = isChecked;
                });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 0),
              child: CheckboxListTile(
                  title: Text('chocolate'),
                  value: chkbx1 ,
                  onChanged: (isChecked){
                    setState(() {
                      chkbx1 = isChecked;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 0),
              child: Text('Quantity',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(onPressed: () {
                  setState(() {

                  });
                  alpha++;
                },
                  color: Colors.green,
                  child: Text('+'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 0),
                  child: Text('$alpha',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(onPressed: () {
                  setState(() {

                  });
                  alpha--;
                },
                  color: Colors.green,
                  child: Text('-'),
                ),

              ],
            ),
            // ignore: deprecated_member_use
            RaisedButton(onPressed: () {
             setState(() {
               controller1 = controller2.text;
               pee = !chkbx;
               pie = !chkbx1;
               beta = alpha;
               gamma = 50*alpha;
             });
            },
              child: Text('order'),
            ),
            // ignore: deprecated_member_use
            RaisedButton(onPressed: () {
              setState(() {
                controller1 = null;
                controller2 = new TextEditingController();
                pee = true;
                pie = true;
                beta = null;
                gamma = null;
                alpha=0;
                chkbx=false;
                chkbx1=false;
              });
            },
              child: Text('reset'),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(controller1 != null? 'name $controller1':'',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),),
            ),
            pee ? SizedBox():Text('topping brownie',style: TextStyle(fontSize: 20),),
            pie ? SizedBox():Text('topping chocolate',style: TextStyle(fontSize: 20),),
            Text(beta != null? 'quantity $beta':'',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,)
            ),
            Text(gamma != null? 'price is $gamma rs ':'',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,)
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () async {
                const url = 'mailto:your@email.com?subject=order%20summary&body=delta'
                ;
                launch(url);
              },
              child: Text("Email"),
            ),


          ],
        ),
      ),
    );
  }
}
