import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/models/member/member.dart';
import 'package:shack_member_directory/models/post/post.dart';
import 'package:shack_member_directory/services/posts/get_member_posts.dart';

class MemberDetailsController extends GetxController {
  // late Member selectedMember;
  Rx<Member> selectedMember = Member(
          id: 0,
          name: '',
          email: '',
          phone: '',
          address: Address(street: '', suite: '', city: '', zipcode: ''),
          company: Company(bs: '', name: '', catchPhrase: ''))
      .obs;
  RxList<Post> allMemberPosts = RxList();
  ScrollController scrollController = ScrollController();
  Rx<bool> loadingData = false.obs;
  Rx<bool> hasMore = true.obs;
  Rx<int> page = 1.obs;
  final int limit = 5;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getAllMemberPosts() async {
    if (loadingData.value || !hasMore.value) return;

    loadingData.value = true;

    try {
      allMemberPosts.value =
          await getMemberPosts(Get.context!, selectedMember.value.id);
      page.value++;
      hasMore.value = allMemberPosts.length == limit;
    } catch (e) {
      print('Error loading data');
    } finally {
      loadingData.value = false;
    }
  }
}
