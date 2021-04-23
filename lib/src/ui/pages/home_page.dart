import 'package:flutter/material.dart';

import 'package:showcaseview/showcaseview.dart';

import 'package:tour_guided_app/src/ui/widgets/category_list_item.dart';

import 'package:tour_guided_app/src/utils/perfs.dart';
import 'package:tour_guided_app/src/utils/categories.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();

  final _prefs = Prefs();

  @override
  Widget build(BuildContext context) {
    _prefs.displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]);
      }
    });

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Showcase(
        key: _one,
        description: "Desde aqui tienes acceso al menu",
        child: IconButton(
          icon: Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
      ),
      actions: [
        Showcase(
            key: _two,
            title: "Contador",
            description: "Aqui puedes revisar el contador",
            showcaseBackgroundColor: Colors.blue[100],
            child: IconButton(
              icon: Icon(Icons.countertops_rounded, color: Colors.black87),
              onPressed: () {},
            )),
      ],
    );
  }

  SafeArea body() {
    return SafeArea(
        child: ListView(
      children: [
        Container(
            margin: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                Showcase.withWidget(
                  key: _three,
                  width: 140.0,
                  height: 50.0,
                  shapeBorder: CircleBorder(),
                  container: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[400]),
                        child: Icon(Icons.text_fields),
                      ),
                      SizedBox(height: 10),
                      Text("Aqui esta el titulo de la aplicacion",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  child: title(),
                ),
                SizedBox(height: 30.0),
                Showcase(
                  key: _four,
                  description: "Aqui puedes buscar",
                  descTextStyle: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  child: searchBox(),
                ),
                SizedBox(height: 30.0),
                Showcase(
                  key: _five,
                  description: "Escoge una categoria",
                  child: categories(),
                )
              ],
            ))
      ],
    ));
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Titulo",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0)),
          Text("Este es el subtitulo de la pantalla",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0)),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Icon(Icons.search, color: Colors.black45),
      SizedBox(height: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Buscar...",
            contentPadding: EdgeInsets.symmetric(vertical: 1.0),
            hintStyle: TextStyle(color: Colors.black87),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
        ),
      )
    ]);
  }

  Widget categories() {
    return Container(
      height: 185.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var categoryIten in categoryList.categoryItems)
            Builder(
                builder: (context) => CategoryListItem(category: categoryIten))
        ],
      ),
    );
  }
}
