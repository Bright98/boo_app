import 'package:clipboard/clipboard.dart';
import 'package:Boo/Services/Services.dart';
import 'package:Boo/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'index.dart';

class LinkBody extends StatefulWidget {
  final id;
  final name;
  LinkBody({@required this.id, @required this.name});
  @override
  _LinkBodyState createState() => _LinkBodyState();
}

class _LinkBodyState extends State<LinkBody> {
  Services services = Services();

  var itemModel;

  @override
  void initState() {
    super.initState();

    itemModel = Provider.of<ItemModel>(context, listen: false).removeItem;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xffC2E8BA),
        elevation: 0,
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(widget.name),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: IconButton(
                      splashColor: Color(0xff455D40),
                      icon: Icon(
                        Icons.copy,
                        color: Color(0xff455D40),
                        size: 20,
                      ),
                      onPressed: () {
                        FlutterClipboard.copy(widget.name);
                      }),
                ),
                IconButton(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Color(0xff455D40),
                      size: 20,
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Remove this item?'),
                            actions: [
                              CustomButton(
                                btnChild: Text('Yes'),
                                btnClick: () async {
                                  bool res = await Provider.of<ItemModel>(
                                          context,
                                          listen: false)
                                      .removeItem(widget.id);
                                  if (res == true) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                              CustomButton(
                                btnChild: Text('No'),
                                btnClick: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
