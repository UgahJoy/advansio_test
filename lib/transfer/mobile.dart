// ignore_for_file: must_be_immutable

import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/transfer/widgets/all_contacts.dart';
import 'package:advansio_test_mobile/transfer/widgets/recents_beneficiaries.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Mobile extends StatelessWidget {
  Mobile({super.key});
  List<RecentBeneficiaries> recent = [];
  @override
  Widget build(BuildContext context) {
    recent = [
      RecentBeneficiaries(
        image: "assets/hailey.png",
        name: "Hailey",
        onTap: () {},
      ),
      RecentBeneficiaries(image: "assets/zayn.png", name: "Zayn", onTap: () {}),
      RecentBeneficiaries(
        image: "assets/thomas.png",
        name: "Thomas",
        onTap: () {},
      ),
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                "Recent",
                style: subHeaders.copyWith(
                  fontSize: 18,
                ),
              ),
              Gap(8),
              SizedBox(
                height: context.deviceHeight * 0.16,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recent.length,
                  itemBuilder: (context, index) => recent[index],
                ),
              ),
              Gap(40),
            ],
          ),
        ),
        AllContacts()
      ],
    );
  }
}
