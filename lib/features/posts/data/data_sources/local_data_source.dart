import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/constants/api/api_keys.dart';
import 'package:posts_app/core/errors/exceptions.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCashedPosts();
  Future<Unit> cashePosts(List<PostModel> posts);
}

class LocalDataSourceImplementation implements LocalDataSource {
  final SharedPreferences pref;

  LocalDataSourceImplementation({required this.pref});
  @override
  Future<Unit> cashePosts(List<PostModel> posts) {
    List<Map<String, dynamic>> encodedJson =
        posts.map<Map<String, dynamic>>((postmodel) {
      return postmodel.toJson();
    }).toList();

    pref.setString(ApiKeys.casedhPosts, jsonEncode(encodedJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCashedPosts() {
    final encodedJson = pref.getString(ApiKeys.casedhPosts);
    if (encodedJson != null) {
      List decodedJson = jsonDecode(encodedJson);
      List<PostModel> posts = decodedJson.map<PostModel>((json) {
        return PostModel.fromJson(json);
      }).toList();
      print(posts);

      return Future.value(posts);
    } else {
      throw CasheDataException();
    }
  }
}
