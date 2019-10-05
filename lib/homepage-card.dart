import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:todo/font-style.dart';
import 'package:todo/models/food_item.dart';

class HomepageFeaturedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 300.0,
      margin: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(20.0),
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage("assets/chickenbiryani.png"))),
    );
  }
}

class HomePageBody extends StatefulWidget{
  @override
 PlanetRow createState() => new PlanetRow();
 List data = fooditemList.foodItems;

}

class PlanetRow extends State<HomePageBody> {

    @override
  void initState() {
    super.initState();
    // this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      // scrollDirection: Axis.horizontal,
      itemCount: fooditemList.foodItems == null ? 0 : fooditemList.foodItems.length,
      itemBuilder: (BuildContext context, int index){
        return new Container(
        margin: const EdgeInsets.only(
          bottom: 10.0,
          left: 10.0,
          right: 10.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
            dishContent,
          ],
        )
        );
      },
    );
  }
}

final planetThumbnail = new Container(
  margin: new EdgeInsets.symmetric(
    vertical: 16.0,
    horizontal: 10.0,
  ),
  height: 95.0,
  width: 95.0,
  decoration: new BoxDecoration(
      shape: BoxShape.circle,
      image: new DecorationImage(
          fit: BoxFit.fill, image: new AssetImage("assets/chickentikka.jpg"))),
  alignment: FractionalOffset.centerLeft,
);

final dishContent = new Container(
  margin: new EdgeInsets.only(
    left: 120.0,
    right: 5.0,
    top: 20.0,
  ),
  child: Row(
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "Chicken Tikka",
            style: headerTextStyle,
          ),
          new Container(height: 2.0),
          new Text(
            "Turkmani flavor",
            style: subHeaderTextStyle,
          ),
          new Container(height: 7.0),
          new Text(
            "\$ 50",
            style: priceTextStyle,
          ),
          new Container(height: 7.0),
          SmoothStarRating(
            rating: 3.5,
            size: 18,
            starCount: 5,
          ),
          //  ListTileItem(),
        ],
      ),
    ],
  ),
);

final planetCard = new Container(
  height: 130.0,
  margin: new EdgeInsets.only(bottom: 0.0),
  decoration: new BoxDecoration(
    color: Color.fromRGBO(255, 255, 255, 1),
    shape: BoxShape.rectangle,
    borderRadius: new BorderRadius.circular(20.0),
  ),
);

class ListTileItem extends StatefulWidget {
  String title;
  ListTileItem({this.title});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;

  void addItem() {
    setState(() {
      _itemCount = _itemCount + 1;
    });
  }

  void subItem() {
    setState(() {
      _itemCount = _itemCount - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: <Widget>[
            _itemCount != 0
                ? new IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: () => setState(() => _itemCount--),
                  )
                : new Container(),
            new Text(
              _itemCount.toString(),
              style: priceTextStyle,
            ),
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () => setState(() => _itemCount++))
          ],
        ));
  }
}
