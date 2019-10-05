import 'package:flutter/material.dart';
import 'package:todo/homepage-card.dart';
import 'package:todo/font-style.dart';

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
                  backgroundImage: new AssetImage('assets/profile.jpeg'),
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
                title: Text('Deal Of The Day', style: drawerRegularStyle,),
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
                () => {};
              },
            ),
          ]),
      body: new SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new HomepageFeaturedContent(),
              new HomePageBody(),
            ],
          )
        ],
      )),
    );
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
