import 'package:flutter/material.dart';
import 'package:flutter_planets_app/model/Planet.dart';
import 'package:flutter_planets_app/ui/detail/PlanetsDetailPage.dart';
import 'package:flutter_planets_app/util/Navigator.dart';
import 'package:flutter_planets_app/util/TextStyles.dart';
import 'package:flutter_planets_app/widget/SeparatorFooter.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool isHorizontalLayout;

  PlanetSummary(this.planet, {this.isHorizontalLayout = true});

  PlanetSummary.vertical(this.planet) : isHorizontalLayout = false;

  @override
  Widget build(BuildContext context) {
    Widget _setPlanetSubData(String dataValue, String imagePath) {
      return new Row(
        children: <Widget>[
          new Image.asset(
            imagePath,
            height: 16.0,
          ),
          new Container(
            width: 8.0,
          ),
          new Text(
            dataValue,
            style: TextStyles.regularTextStyle,
          ),
        ],
      );
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(isHorizontalLayout ? 76.0 : 16.0,
          isHorizontalLayout ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isHorizontalLayout
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 4.0,
          ),
          new Text(
            planet.name,
            style: TextStyles.headerTextStyle,
          ),
          new Container(
            height: 10.0,
          ),
          new Text(
            planet.location,
            style: TextStyles.subHeaderTextStyle,
          ),
          new SeparatorFooter(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: _setPlanetSubData(
                    planet.distance, "assets/img/ic_distance.png"),
                flex: isHorizontalLayout ? 1 : 0,
              ),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                  child: _setPlanetSubData(
                      planet.gravity, "assets/img/ic_gravity.png"),
                  flex: isHorizontalLayout ? 1 : 0),
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      padding: isHorizontalLayout
          ? null
          : const EdgeInsets.only(top: 8.0, bottom: 12.0),
      height: isHorizontalLayout ? 140.0 : 180.0,
      margin: isHorizontalLayout
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0)),
          ]),
      child: planetCardContent,
    );

    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 24.0),
      alignment: isHorizontalLayout
          ? FractionalOffset.centerLeft
          : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    return new GestureDetector(
      onTap: isHorizontalLayout
          ? () => RouteNavigator.navigateToDetailsPage(context, planet)
          : null,
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
