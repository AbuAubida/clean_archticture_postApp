import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/constants/api/api_keys.dart';
import 'package:posts_app/core/errors/exceptions.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> deletePost(int postId);
  Future<Unit> ubdatePost(PostModel post);
}

class RemoteDataSourceImplemntation implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImplemntation({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
        Uri.parse(EndPoints.baseURL + EndPoints.posts),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List jsonString = json.decode(response.body);
      final List<PostModel> remotePosts = jsonString.map<PostModel>((json) {
        return PostModel.fromJson(json);
      }).toList();

      return Future.value(remotePosts);
    } else {
      throw ServerDataException();
    }
  }

  @override
  Future<Unit> addPost(PostModel post) async {
    final response = await client.post(
      Uri.parse(EndPoints.baseURL + EndPoints.posts),
      body: post.toJson(),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 201) {
      // we used the 201 code as this used when add items to api in http package
      return Future.value(unit);
    } else {
      throw ServerDataException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    print("Deleting post started");
    final response = await client.delete(
      Uri.parse(EndPoints.baseURL + EndPoints.deletePoint(postId)),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      print("post Deleted successfully ");
      return Future.value(unit);
    } else {
      throw ServerDataException();
    }
  }

  @override
  Future<Unit> ubdatePost(PostModel post) async {
    final response = await client.patch(
      Uri.parse(EndPoints.baseURL + EndPoints.deletePoint(post.id)),
      body: post.toJson(),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerDataException();
    }
  }
}
