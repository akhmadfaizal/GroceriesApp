import 'dart:convert';

import 'package:groceries_app/data/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  Future<DataProfile> fetchProfile() async {
    http.Response response =
        await http.get(Uri.parse("https://randomuser.me/api/"));
    if (response.statusCode == 200) {
      return DataProfile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
