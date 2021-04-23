import 'package:flutter/material.dart';

import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tour_guided_app/src/ui/widgets/category_list_item.dart';
import 'package:tour_guided_app/src/utils/categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) =>
  //       ShowCaseWidget.of(context)
  //           .startShowCase([_one, _two, _three, _four, _five]));
  // }

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print("Se escribió en showShowcase");
          else
            print("Ocurrio un problema");
        });
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]);
      }
    });

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Showcase(
                          key: _one,
                          description: "Desde aqui tienes acceso al menu",
                          child: Container(child: Icon(Icons.menu))),
                      Showcase(
                        key: _two,
                        title: "Conador",
                        description: "Aqui puedes revisar el contador",
                        showcaseBackgroundColor: Colors.blue[100],
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Text('0')),
                      )
                    ],
                  ),
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
      )),
    );
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
