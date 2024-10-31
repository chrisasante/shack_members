import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/constants.dart';
import 'package:shack_member_directory/controllers/memberDetailsController.dart';
import 'package:shack_member_directory/screens/members/profile/post/member_posts.dart';
import 'package:shack_member_directory/screens/members/profile/details/profile_details.dart';

class MemberProfile extends StatefulWidget {
  const MemberProfile({super.key});

  @override
  State<MemberProfile> createState() => _MemberProfileState();
}

class _MemberProfileState extends State<MemberProfile>
    with TickerProviderStateMixin {
  int tabIndex = 0;
  late TabController tabController;
  MemberDetailsController memberDetailsController =
      Get.put(MemberDetailsController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);

    tabController.addListener(() {
      setState(() {
        tabIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const Tab(
        text: "Profile",
      ),
      const Tab(
        text: "Posts",
      ),
    ];

    return Obx(() => Scaffold(
          appBar: AppBar(),
          body: SafeArea(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/testing.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: deviceHeight(context) * 0.08,
                      ),
                      Text(
                        memberDetailsController.selectedMember.value.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              // SizedBox(
              //   height: deviceHeight(context) * 0.05,
              // ),
              SizedBox(
                height: deviceHeight(context) * 0.06,
                child: TabBar(
                    onTap: (index) {},
                    controller: tabController,
                    isScrollable: false,
                    tabs: tabs),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.05,
              ),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: const [ProfileDetails(), MemberPosts()],
              ))
            ],
          )),
        ));
  }
}
