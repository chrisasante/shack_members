import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/constants.dart';
import 'package:shack_member_directory/controllers/memberController.dart';
import 'package:shack_member_directory/controllers/memberDetailsController.dart';
import 'package:shack_member_directory/widgets/member_card.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  MemberController memberController = Get.put(MemberController());
  MemberDetailsController memberDetailsController =
      Get.put(MemberDetailsController());

  void openMemberProfile(int memberId) async {
    var setMemberData = await memberController.setSelectedMemberData(memberId);

    if (setMemberData.id == memberId) {
      memberDetailsController.selectedMember.value = setMemberData;
      Get.toNamed('/member_profile', arguments: [setMemberData]);
    } else {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again",
        colorText: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: memberController.loadingData.value
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    children: [
                      const Text(
                        'This is a list of members of SHACK15',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: deviceHeight(context) * 0.03,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: memberController.searchForMembers,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              // filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  top: deviceHeight(context) * 0.03),
                              controller: memberController.scrollController,
                              itemCount:
                                  memberController.filteredShackMembers.length +
                                      (memberController.hasMore.value ? 1 : 0),
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    MemberCard(
                                        memberName: memberController
                                            .filteredShackMembers[index].name,
                                        memberImage:
                                            'assets/images/testing.jpg',
                                        companyName: memberController
                                            .filteredShackMembers[index]
                                            .company!
                                            .name,
                                        onTap: () => openMemberProfile(
                                            memberController
                                                .filteredShackMembers[index]
                                                .id))
                                  ],
                                );
                              })))
                    ],
                  ),
                ),
        ));
  }
}
