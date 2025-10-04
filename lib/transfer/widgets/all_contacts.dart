import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/transfer/widgets/all_contacts_items.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllContacts extends StatefulWidget {
  const AllContacts({super.key});

  @override
  State<AllContacts> createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  final searchController = TextEditingController();
  List<DataTum> searches = [
    DataTum(
      image: "assets/hailey.png",
      name: "Hailey",
      isLast: true,
      phoneNumber: "+028219121",
    ),
    DataTum(
      image: "assets/zayn.png",
      name: "Zayn",
      isLast: true,
      phoneNumber: "+090078601",
    ),
    DataTum(
      image: "assets/thomas.png",
      name: "Thomas",
      isLast: false,
      phoneNumber: "+013119121",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var searchResult = searches.where((item) {
      final nameMatches = item.name.toLowerCase().contains(
        searchController.text.toLowerCase(),
      );
      final numberMatches = item.phoneNumber.toLowerCase().contains(
        searchController.text.toLowerCase(),
      );
      return nameMatches || numberMatches;
    }).toList();
    return Container(
      height: context.deviceHeight * 0.45,
      decoration: BoxDecoration(color: AppColors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Text(
              "All contacts",
              style: subHeaders.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(16),
            AppTextfield(
              onChanged: (val) {
                setState(() {});
              },
              showPrefixIcon: true,
              hintTextfontSize: 14,
              hintTextFontWeight: FontWeight.w700,
              hintTextColor: AppColors.phoneNumberGrey,
              prefixIcon: Image.asset("assets/search.png", height: 16),
              controller: searchController,
              hintText: "search name or number..",
            ),
            Gap(16),

            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) => SearchBeneficiaries(
                  phoneNumber: searchResult[index].phoneNumber,
                  name: searchResult[index].name,
                  image: searchResult[index].image,
                  isLast: searchResult[index].isLast,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTum {
  final String name;
  final String image;
  final bool isLast;
  final String phoneNumber;
  DataTum({
    required this.image,
    required this.name,
    required this.isLast,
    required this.phoneNumber,
  });
}
