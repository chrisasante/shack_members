import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shack_member_directory/models/member/member.dart';

Future<Member> getMember(BuildContext context, int memberId) async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users/$memberId');

  var response = await http.get(url);

  var membersJson = json.decode(response.body);

  return Member.fromJson(membersJson);
}
