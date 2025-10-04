// ignore_for_file: unrelated_type_equality_checks

import 'package:advansio_test_mobile/news/widget/new_card.dart';
import 'package:advansio_test_mobile/news/widget/news_selectors.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final searchHelpController = TextEditingController();
  int currentIndex = 0;
  bool isCardOpened = false;
  void _handleSelection(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _handleNewTrialerIcon(bool isOpened) {
    setState(() {
      isCardOpened = !isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeAreaTop: false,
      scaffoldPadding: 0,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backGroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewsSelectors(
            currentIndex: currentIndex,
            onChanged: _handleSelection,
          ),
          const Gap(30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppTextfield(
              onChanged: (p0) {
                setState(() {});
              },
              showPrefixIcon: true,
              hintTextfontSize: 14,
              hintTextFontWeight: FontWeight.w700,
              hintTextColor: AppColors.phoneNumberGrey,
              prefixIcon: Image.asset("assets/search.png", height: 16),
              controller: searchHelpController,
              hintText: "Search news...",
            ),
          ),
          const Gap(30),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemBuilder: (context, index) => NewCard(
                newsInfo: "news body",
                title: "Breaking new",
                isNewOpend: isCardOpened,
                isOpened: _handleNewTrialerIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 // void isNewsScreenOpened(int index) {
  //   setState(() {
  //     NewsScreenDaTum[index] = NewsScreenDaTum(
  //         subText: NewsScreenDaTum[index].subText,
  //         title: NewsScreenDaTum[index].title,
  //         isOpened: !NewsScreenDaTum[index].isOpened);
  //   });
  // }
// List<dynamic> searchNewsScreen() {
  //   return NewsScreenDaTum.where(
  //     (search) => search.title.toString().toLowerCase().contains(
  //       searchHelpController.text.toLowerCase(),
  //     ),
  //   ).toList();
  // }
 // 