import 'package:Boo/Services/Services.dart';
import 'package:Boo/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'index.dart';

class AddNewLinkForm extends StatefulWidget {
  final id;
  AddNewLinkForm({@required this.id});

  @override
  _AddNewLinkFormState createState() => _AddNewLinkFormState();
}

class _AddNewLinkFormState extends State<AddNewLinkForm> {
  Services services = Services();
  String itemvalue;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
                child: Center(
                    child: ListView(shrinkWrap: true, children: [
              CustomTextField(
                'category item',
                color: Color(0xffF59C00),
                onchange: (String value) {
                  setState(() {
                    itemvalue = value;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomButton(
                    btnClick: () async {
                      if (itemvalue.length != 0) {
                        bool res =
                            await Provider.of<ItemModel>(context, listen: false)
                                .addItem(itemvalue, widget.id);
                        if (res) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    btnChild: Text('Add'),
                    btnColor: Color(0xffF59C00),
                    btnWidth: double.infinity,
                  ))
            ])))));
  }
}
