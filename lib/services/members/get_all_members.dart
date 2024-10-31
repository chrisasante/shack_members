import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shack_member_directory/models/member/member.dart';

Future<List<Member>> getAllMembers(BuildContext context) async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  var response = await http.get(url);
  var members = <Member>[];

  if (response.statusCode == 200) {
    var membersJson = json.decode(response.body);

    for (var memberJson in membersJson) {
      members.add(Member.fromJson(memberJson));
    }
  }

  return members;
}
