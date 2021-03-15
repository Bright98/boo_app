import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  // final String baseUrl = 'http://10.0.2.2:8000';
  final String baseUrl = 'http://getboo.ir';

  getStoreValue(String key) async {
    final store = await SharedPreferences.getInstance();
    return store.getString(key);
  }

  setStoreValue(String key, String value) async {
    final store = await SharedPreferences.getInstance();
    store.setString(key, value);
  }

  Future<List<dynamic>> getItems(String id) async {
    final response = await http.get('$baseUrl/category_item/$id/');

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final List<dynamic> items = json.decode(body);

    return items;
  }

  Future<dynamic> getCategories() async {
    final accessToken = await getStoreValue('access_token');

    final response = await http
        .get('$baseUrl/categories', headers: {'authorization': accessToken});

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final List<dynamic> categories = json.decode(body);

    return categories;
  }

  Future<dynamic> setCategory(name) async {
    final accessToken = await getStoreValue('access_token');

    final response = await http.post('$baseUrl/category/',
        body:
            jsonEncode(<dynamic, dynamic>{'name': name, 'token': accessToken}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    return true;
  }

  Future<dynamic> deleteCategory(id) async {
    final response = await http.post('$baseUrl/remove_category/',
        body: jsonEncode(<dynamic, dynamic>{'id': id}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    return true;
  }

  Future<List<dynamic>> setCategoryItem(item, id) async {
    final response = await http.post('$baseUrl/category_item/',
        body: jsonEncode(<dynamic, dynamic>{'item': item, 'id': id}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final List<dynamic> items = json.decode(body);

    return items;
  }

  Future<List<dynamic>> deleteCategoryItem(id) async {
    final response = await http.post('$baseUrl/remove_category_item/',
        body: jsonEncode(<dynamic, dynamic>{'id': id}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final List<dynamic> items = json.decode(body);

    return items;
  }

  Future<dynamic> signup(name, email, password) async {
    final response = await http.post('$baseUrl/signup/',
        body: jsonEncode(<dynamic, dynamic>{
          'name': name,
          'email': email,
          'password': password
        }));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final userId = json.decode(body);

    if (userId["data"] != 'this email exist') {
      await setStoreValue('access_token', userId["data"]);
      await setStoreValue('name', userId["name"]);
    }

    return userId;
  }

  Future<dynamic> login(email, password) async {
    final response = await http.post('$baseUrl/login/',
        body: jsonEncode(
            <dynamic, dynamic>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final userId = json.decode(body);

    if (userId["data"] != 'password not correct' &&
        userId["data"] != 'account not exist') {
      await setStoreValue('access_token', userId["data"]);
      await setStoreValue('name', userId["name"]);
    }

    return userId;
  }

  Future<dynamic> sendMail(email) async {
    final response = await http.post('$baseUrl/send_mail/',
        body: jsonEncode(<dynamic, dynamic>{'email': email}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final message = json.decode(body);

    return message;
  }

  Future<dynamic> codeConfirm(code) async {
    final response = await http.post('$baseUrl/confirm_code/',
        body: jsonEncode(<dynamic, dynamic>{'code': code}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final message = json.decode(body);

    return message;
  }

  Future<dynamic> resetPass(password) async {
    final response = await http.post('$baseUrl/reset_pass/',
        body: jsonEncode(<dynamic, dynamic>{'password': password}));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = utf8.decode(response.bodyBytes);
    final userId = json.decode(body);

    if (userId["data"] != 'somethig get wrong') {
      await setStoreValue('access_token', userId["data"]);
      await setStoreValue('name', userId["name"]);
    }

    return userId;
  }
}
