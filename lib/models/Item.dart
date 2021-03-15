import 'dart:collection';
import 'package:Boo/Services/Services.dart';
import 'package:flutter/material.dart';

class ItemModel extends ChangeNotifier {
  Services services = Services();
  List<dynamic> _items = [];

  UnmodifiableListView<dynamic> get items => UnmodifiableListView(_items);

  getItems(listId) async {
    _items = await services.getItems(listId);
    notifyListeners();
  }

  removeItem(itemId) async {
    _items = await services.deleteCategoryItem(itemId);
    notifyListeners();
    return true;
  }

  addItem(itemValue, itemId) async {
    _items = await services.setCategoryItem(itemValue, itemId);
    notifyListeners();
    return true;
  }
}
