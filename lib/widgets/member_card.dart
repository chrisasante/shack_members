import 'package:flutter/material.dart';
import 'package:shack_member_directory/constants.dart';

class MemberCard extends StatelessWidget {
  final String memberName;
  final String memberImage;
  final String? companyName;
  final void Function() onTap;

  const MemberCard(
      {super.key,
      required this.memberName,
      required this.memberImage,
      this.companyName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    memberImage,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    memberName,
                    style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.005,
                  ),
                  Text(companyName!),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
