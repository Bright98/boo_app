import 'package:flutter/material.dart';
import 'index.dart';

class LinkList extends StatefulWidget {
  List items;
  LinkList(this.items);
  @override
  _LinkListState createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView(children: [
          for (var i = 0; i < widget.items.length; i++)
            LinkBody(id: widget.items[i]["id"], name: widget.items[i]["name"])
        ]),
      ),
    );
  }
}
