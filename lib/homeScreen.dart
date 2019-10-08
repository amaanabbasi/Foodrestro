import 'package:flutter/material.dart';
import 'package:todo/homepage-card.dart';
import 'package:todo/font-style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:todo/models/food_item.dart';
import 'package:todo/cart.dart';

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
                                    fooditemList.foodItems[index].imgUrl))),
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
                                new Text(fooditemList.foodItems[index].title,
                                    style: headerTextStyle,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis),
                                new Container(height: 2.0),
                                new Text(
                                  fooditemList.foodItems[index].description,
                                  style: subHeaderTextStyle,
                                ),
                                new Container(height: 7.0),
                                new Text(
                                  "\$ " +
                                      fooditemList.foodItems[index].price
                                          .toString(),
                                  style: priceTextStyle,
                                ),
                                new Container(height: 7.0),
                                SmoothStarRating(                                  
                                  rating: fooditemList.foodItems[index].ratings,
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
                childCount: 6,
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

// drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Mughal Cuisine', style:drawerHeaderStyle),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,

//               )
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
