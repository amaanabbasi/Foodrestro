import 'package:flutter/material.dart';
import 'package:todo/homepage-card.dart';
import 'package:todo/font-style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:todo/models/food_item.dart';
import 'package:todo/cart.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<Meal> fetchMeal() async {
//   final String url = '127.0.0.1:8000/api/customer/meals/6';
//   final response =  await http.get(url);

//   if (response.statusCode == 200) {
//     // If the call to the server was successful, parse the JSON.
//     return Meal.fromJson(json.decode(response.body));
//   } else {
//     // If that call was not successful, throw an error.
//     throw Exception('Failed to load post');
//   }
// }

// class Meal {
//  final  int id;
//  final  String title;
//  final  String description;
//  final  double price;
//  final  double ratings;
//  final  String imgUrl;
//  final  int quantity;

//     Meal({
//     @required this.id,
//     @required this.title,
//     @required this.description,
//     @required this.price,
//     @required this.imgUrl,
//     @required this.ratings,
//     this.quantity = 1,
//   });


//   factory Meal.fromJson(Map<String, dynamic> json) {
//     return Meal(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: json['price'],
//       imgUrl: json['imgUrl'],
//       ratings: json['ratings'],
//     );
//   }
// }

// class MealitemList {
//   List<Meal> mealItems;

//   MealitemList({@required this.mealItems});
// }
class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // MealitemList mealitemList = MealitemList(mealItems:fetchMeal());
  Map data;
  List mealData;

    Future getData() async {
      final String url = 'http://192.168.0.105:8000/api/customer/meals/7';
    http.Response response = await http.get(url);
      data = json.decode(response.body);
      
    setState(() {
      mealData = data["meals"];
      // debugPrint(mealData[0].name.toString());
    });
  }
  
  @override
  void initState() {
    super.initState();
    getData();
    
  }

 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(
          child: GestureDetector(
            onTap: () {},
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.orange[800],
                        Colors.orange[700],
                        Colors.orange[600],
                        Colors.orange[400],
                      ],
                    ),
                  ),
                  accountName: new Text('Asim Pasha', style: drawerHeaderStyle),
                  accountEmail:
                      new Text('asimpasha@gmail.com', style: drawerEmailStyle),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new AssetImage('assets/profile.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('My Orders', style: drawerRegularStyle),
                  trailing: Icon(Icons.arrow_forward_ios),
                  // leading: Icon(Icons.home, color: myColor),
                  onTap: () {
                    print("Going to home");
                    //Close the drawer
                    Navigator.of(context).pop();
                    //Navigate to home page
                    //Navigate with avoiding the possibility to return
                    // Navigator.of(context).pushReplacementNamed(HomePage.tag);
                  },
                ),
                ListTile(
                  title: Text(
                    'Deal Of The Day',
                    style: drawerRegularStyle,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  // leading: Icon(Icons.home, color: myColor),
                  onTap: () {
                    print("Going to deal of the day");
                    //Close the drawer
                    Navigator.of(context).pop();
                    //Navigate to home page
                    //Navigate with avoiding the possibility to return
                    // Navigator.of(context).pushReplacementNamed(HomePage.tag);
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        appBar: new AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Builder(
              builder: (context) => IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
            ),
            actions: <Widget>[
              // action button
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context, 
                    SlideLeftRoute(page: FirstRoute())
                    );                // CupertinoPageRoute(builder: (context) => FirstRoute()));  
                },    
              ),
              
            ]),
        body: new Container(
            child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                HomepageFeaturedContent(),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Stack(
                    children: <Widget>[
                      //planetCard
                      new Container(
                        height: 130.0,
                        margin: new EdgeInsets.only(
                            right: 10.0, left: 10.0, bottom: 10.0),
                        decoration: new BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      new Container(
                        //dish thumbnail
                        margin: new EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                        height: 95.0,
                        width: 95.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                   mealData[index]["image"]))),
                        alignment: FractionalOffset.centerLeft,
                      ),
                      new Container(
                        // dish Content
                        margin: new EdgeInsets.only(
                          left: 130.0,
                          right: 5.0,
                          top: 20.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(mealData[index]["name"],
                                    style: headerTextStyle,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis),
                                new Container(height: 2.0),
                                // new Text(
                                //   mealData[index].short_description,
                                //   style: subHeaderTextStyle,
                                // ),
                                new Container(height: 7.0),
                                new Text(
                                  "\$ " +
                                      mealData[index]["price"]
                                          .toString(),
                                  style: priceTextStyle,
                                ),
                                new Container(height: 7.0),
                                SmoothStarRating(                                  
                                  rating: 3.0,
                                  allowHalfRating: true,
                                  size: 19,
                                  starCount: 5,
                                  color: Colors.orange,
                                  borderColor: Colors.orange,
                                ),
                                //  ListTileItem(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                childCount: mealData == null ? 0 : mealData.length,
              ),
            )
          ],
        )
            //     child: Stack(
            //   children: <Widget>[
            //     new Column(
            //       children: <Widget>[
            //         // new HomepageFeaturedContent(),
            //         new HomePageBody(),
            //       ],
            //     )
            //   ],
            // )),
            ));
  }
}
