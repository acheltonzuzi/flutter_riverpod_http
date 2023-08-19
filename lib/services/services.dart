import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http_riverpod/models/userModel.dart';

class ApiServices {
  String url = 'https://reqres.in/api/users?page=2';
  Future<List<User>> getUser() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      print(result.map((e) => User.fromJson(e)).toList()[0].avatar);
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}


final userProvider=Provider<ApiServices>((ref) => ApiServices());

