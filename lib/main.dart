import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/screens/members/profile/member_profile.dart';
import 'package:shack_member_directory/screens/members/list/members_list.dart';

import 'screens/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(30, 30, 30, 1)),
        useMaterial3: true,
      ),
      initialRoute: '/homepage',
      routes: {
        '/homepage': (context) => const HomePage(),
        '/members_list': (context) => const MembersList(),
        '/member_profile': (context) => const MemberProfile(),
      },
      // home: const HomePage(title: "My Homepage"),
    );
  }
}
