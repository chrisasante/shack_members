import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/models/member/member.dart';
import 'package:shack_member_directory/services/members/get_all_members.dart';
import 'package:shack_member_directory/services/members/get_member.dart';
import 'package:shack_member_directory/widgets/debouncer.dart';

class MemberController extends GetxController {
  RxList<Member> allShackMembers = RxList();
  Rx<Member> selectedMember = Member(
          id: 0,
          name: '',
          email: '',
          phone: '',
          address: Address(street: '', suite: '', city: '', zipcode: ''),
          company: Company(bs: '', name: '', catchPhrase: ''))
      .obs;
  RxList<Member> filteredShackMembers = RxList();
  ScrollController scrollController = ScrollController();
  Rx<bool> loadingData = false.obs;
  Rx<bool> hasMore = true.obs;
  Rx<int> page = 1.obs;
  final int limit = 5;
  final debouncer = Debouncer(delay: const Duration(milliseconds: 300));

  @override
  void onInit() async {
    super.onInit();
    getMembers();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loadingData.value) {
        getMembers();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<Member> setSelectedMemberData(int memberId) async {
    loadingData.value = true;
    try {
      selectedMember.value = (await getMember(Get.context!, memberId));
    } catch (e) {
      print('Error setting data');
    } finally {
      loadingData.value = false;
      return selectedMember.value;
    }
  }

  void searchForMembers(String searchText) {
    debouncer(() {
      if (searchText.isEmpty) {
        filteredShackMembers.value = allShackMembers;
      } else {
        filteredShackMembers.value = allShackMembers.where((member) {
          return member.name.toLowerCase().contains(searchText.toLowerCase());
        }).toList();
      }
    });
  }

  Future getMembers() async {
    if (loadingData.value || !hasMore.value) return;

    loadingData.value = true;

    try {
      allShackMembers.value = await getAllMembers(Get.context!);
      filteredShackMembers.value = allShackMembers;
      page.value++;
      hasMore.value = allShackMembers.length == limit;
    } catch (e) {
      print('Error loading data');
    } finally {
      loadingData.value = false;
    }
  }
}
