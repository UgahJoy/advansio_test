// ignore_for_file: unrelated_type_equality_checks

import 'package:advansio_test_mobile/news/news_body.dart';
import 'package:advansio_test_mobile/news/widget/news_selectors.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  final searchHelpController = TextEditingController();
  final List<String> newsSuffix = ["ng", "gh", "ao", "ne"];
  int currentIndex = 0;
  bool isCardOpened = false;
  void _handleSelection(int index) {
    setState(() {
      currentIndex = index;
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
          NewsBody(
            countrySuffix: newsSuffix[currentIndex],
          )
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