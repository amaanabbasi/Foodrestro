import 'package:flutter/material.dart';
import 'package:todo/font-style.dart';
import 'package:todo/models/food_item.dart';

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
            color: Colors.white,
            height: height,
            margin: const EdgeInsets.only(
              top: 1.0,
              left: 20.0,
              right: 20.0,
            ),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("My", style: cartHeaderStyle),
                        Text("Order", style: cartSubHeaderStyle),
                        Container(
                          height: width / 14,
                        ),
                        Container( // Cart Items
                          color: Colors.white12,
                          height: height / 2.0, //Your custom height
                          // decoration: BoxBorder(),
                          child: new ListView.builder(
                              itemCount: fooditemList.foodItems.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return new Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: new EdgeInsets.only(
                                        // vertical: 16.0,
                                        // horizontal: 20.0,
                                        bottom: 5.0,
                                      ),
                                      height: 42.0,
                                      width: 42.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  fooditemList.foodItems[index]
                                                      .imgUrl))),
                                      alignment: FractionalOffset.centerLeft,
                                    ),
                                    Container(
                                      width:width / 2.2,
                                      margin: EdgeInsets.only(left: 50),
                                      child: Text(fooditemList.foodItems[index].title,
                                        style: cartRegularStyle)
                                    ),
                                    Container(alignment: Alignment.bottomRight,
                                    child: Text( " \$" + fooditemList.foodItems[index].price.toString()))
                                    
                                  ],
                                );
                              }),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: width / 2.5),
                            width: width,
                            color: Colors.white,
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
                          color: Colors.yellow,
                          width: width,
                          height: 50,
                          padding: const EdgeInsets.only(top: 0.0),
                          child: new RaisedButton(
                            child: new Text("Place Order",
                                style: new TextStyle(
                                  color: Colors.black,
                                )),
                            onPressed: () {
                              print("Button pressed");
                            },
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            )));
  }
}
