import 'package:flutter/material.dart';
import 'index.dart';

class CategoryList extends StatefulWidget {
  final List category;
  CategoryList({this.category});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
        flex: 1,
        child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: size.width,
                child: ListView(
                  children: [
                    Wrap(
                      children: [
                        for (var i = 0; i < widget.category.length; i++)
                          CategoryNameCard(size.width,
                              title: widget.category[i]["category_name"],
                              id: widget.category[i]["id"])
                      ],
                    )
                  ],
                ))));
  }
}
