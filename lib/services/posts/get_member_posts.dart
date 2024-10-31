import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shack_member_directory/models/post/post.dart';

Future<List<Post>> getMemberPosts(BuildContext context, int memberId) async {
  var url =
      Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$memberId');

  var response = await http.get(url);
  var posts = <Post>[];

  if (response.statusCode == 200) {
    var postsJson = json.decode(response.body);

    for (var postJson in postsJson) {
      posts.add(Post.fromJson(postJson));
    }
  }

  return posts;
}
