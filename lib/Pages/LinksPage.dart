import 'package:Boo/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:Boo/Widgets/index.dart';
import 'package:provider/provider.dart';

class LinksPage extends StatefulWidget {
  final id;
  final title;
  LinksPage({@required this.id, @required this.title});

  @override
  _LinksPageState createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  // var backgroundColor = Color(0xffC2E8BA);
  var backgroundColor = Color(0xffffffff);

  @override
  void initState() {
    super.initState();

    Provider.of<ItemModel>(context, listen: false).getItems(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  RemoveCategory(id: widget.id),
                ],
              ),
              LinkImages(),
              LinkTitle(title: widget.title),
              AddLinkButton(id: widget.id),
              Consumer<ItemModel>(builder: (context, item, child) {
                return LinkList(item.items);
              })
            ],
          ),
        ),
      ),
    );
  }
}
