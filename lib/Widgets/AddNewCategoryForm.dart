import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class AddNewCategoryForm extends StatefulWidget {
  @override
  _AddNewCategoryFormState createState() => _AddNewCategoryFormState();
}

class _AddNewCategoryFormState extends State<AddNewCategoryForm> {
  String categoryvalue;
  Services services = Services();

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Form(
                child: Center(
                    child: ListView(shrinkWrap: true, children: [
              CustomTextField(
                'category name',
                color: Colors.grey,
                onchange: (String value) {
                  categoryvalue = value;
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomButton(
                    btnClick: () async {
                      if (categoryvalue.length != 0) {
                        var res = await services.setCategory(categoryvalue);
                        if (res == true) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    btnChild: Text('Add'),
                    btnColor: Colors.grey,
                    btnWidth: double.infinity,
                  ))
            ])))));
  }
}
