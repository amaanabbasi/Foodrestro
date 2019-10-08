import 'package:flutter/material.dart';
import 'package:todo/font-style.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(''),
          elevation: 0.0,
        ),
        body: Container(
            color: Colors.yellow,
            height: height,
            margin: const EdgeInsets.only(
              top: 40.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("My", style: cartHeaderStyle),
                Text("Order", style: cartSubHeaderStyle),
                Container(
                  color: Colors.red,
                  height: height / 2, //Your custom height
                  child: ListView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: <Widget>[
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                      Text("Order", style: cartSubHeaderStyle),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: width / 2.5),
                    width: width,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total: ", style: cartSubHeaderStyle),
                        Text(
                          "\$ 45",
                          style: cartHeaderStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                new Container(
                  width: width,
                  height: width / 8,
                    padding: const EdgeInsets.only(top: 0.0),
                      child: new RaisedButton(
                        child: new Text("Place Order",
                            style: new TextStyle(
                              color: Colors.white,
                            )),
                        colorBrightness: Brightness.dark,
                        onPressed: () {
                          print("Button pressed");
                        },
                        color: Colors.white24,
                      ),
                    ),
              ],
            )));
  }
}
