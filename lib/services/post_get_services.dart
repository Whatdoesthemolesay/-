import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:testovoe_zadanie/models/get_token.dart';
import 'package:testovoe_zadanie/models/registration_get.dart';
import 'package:testovoe_zadanie/models/regular_post.dart';
import 'package:testovoe_zadanie/models/summary_github_post.dart';


class PostServices{

  final API = 'https://vacancy.dns-shop.ru';

  Future<TokenPostGetter> createAlbum(RegularPost regularPost) async {
    final http.Response response = await http.post(
      API+ '/api/candidate/token',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(regularPost.toJson()),
    );

    if (response.statusCode == 200) {
      return TokenPostGetter.fromJson(json.decode(response.body));
    } else {
      throw Exception('Не получилось');
    }
  }

  Future<Registration> Register(String data, SummaryGitHubPost summaryGitHubPost) async {
    final http.Response response = await http.post(
      API + '/api/candidate/summary',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $data'
      },
      body: jsonEncode(summaryGitHubPost.toJson()),
    );

    if (response.statusCode == 200) {
      return Registration.fromJson(json.decode(response.body));
    } else {
      throw Exception('Не получилось');
    }
  }
}