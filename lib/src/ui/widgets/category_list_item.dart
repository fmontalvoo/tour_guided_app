import 'package:flutter/material.dart';

import 'package:tour_guided_app/src/utils/categories.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryItem category;

  CategoryListItem({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: category.selected ? Colors.blue[400] : Colors.white,
          border: Border.all(
              color: category.selected ? Colors.transparent : Colors.grey[200],
              width: 1.5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                blurRadius: 15,
                offset: Offset(15, 0),
                spreadRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: category.selected
                        ? Colors.transparent
                        : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              category.categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            category.counter.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}
