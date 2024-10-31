import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shack_member_directory/controllers/memberDetailsController.dart';
import 'package:shack_member_directory/widgets/details_list.dart';
import 'package:readmore/readmore.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  MemberDetailsController memberDetailsController =
      Get.put(MemberDetailsController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      memberDetailsController.getAllMemberPosts();
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              const TextSpan(
                  text: 'About ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              TextSpan(
                  text: memberDetailsController.selectedMember.value.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const ReadMoreText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            trimMode: TrimMode.Line,
            trimLines: 3,
            colorClickableText: Colors.blue,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
            lessStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(
            height: 20,
          ),
          DetailsList(
              icon: Icons.email,
              info: memberDetailsController.selectedMember.value.email!),
          const SizedBox(
            height: 20,
          ),
          DetailsList(
              icon: Icons.location_city,
              info:
                  memberDetailsController.selectedMember.value.company!.name!),
          const SizedBox(
            height: 20,
          ),
          DetailsList(
              icon: Icons.location_on,
              info:
                  '${memberDetailsController.selectedMember.value.address!.street!} ${memberDetailsController.selectedMember.value.address!.suite!} ${memberDetailsController.selectedMember.value.address!.city!}'),
          const SizedBox(
            height: 20,
          ),
          DetailsList(
              icon: Icons.phone,
              info: memberDetailsController.selectedMember.value.phone!),
          const SizedBox(
            height: 20,
          ),
          DetailsList(
              icon: Icons.web_asset,
              info: memberDetailsController.selectedMember.value.website!),
        ],
      ),
    );
  }
}
