import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/constants.dart';
import 'package:shack_member_directory/controllers/memberDetailsController.dart';

class MemberPosts extends StatefulWidget {
  const MemberPosts({super.key});

  @override
  State<MemberPosts> createState() => _MemberPostsState();
}

class _MemberPostsState extends State<MemberPosts> {
  MemberDetailsController memberDetailsController =
      Get.put(MemberDetailsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                controller: memberDetailsController.scrollController,
                itemCount: memberDetailsController.allMemberPosts.length +
                    (memberDetailsController.hasMore.value ? 1 : 0),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          child: ListTile(
                            title: Text(memberDetailsController
                                .allMemberPosts[index].title!),
                            subtitle: Text(memberDetailsController
                                .allMemberPosts[index].body!),
                            titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: primaryColor),
                          ),
                        ),
                      )
                    ],
                  );
                }))),
      ],
    );
  }
}
