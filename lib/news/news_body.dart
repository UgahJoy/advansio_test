import 'package:advansio_test_mobile/news/widget/new_card.dart';
import 'package:advansio_test_mobile/repositories/global_repository.dart';
import 'package:advansio_test_mobile/shared_state/app_state.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class NewsBody extends ConsumerStatefulWidget {
  final String countrySuffix;
  const NewsBody({
    super.key,
    required this.countrySuffix,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsBodyState();
}

class _NewsBodyState extends ConsumerState<NewsBody> {
  bool isBusy = true;
  @override
  void initState() {
    ref.read(globalRepository).fetchNews(widget.countrySuffix).then((val) {
      isBusy = false;
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  final searchHelpController = TextEditingController();
  int currentIndex = 0;
  bool isCardOpened = false;
  void _handleNewTrialerIcon(bool isOpened) {
    setState(() {
      isCardOpened = !isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    var news = ref.watch(appState).allNews[widget.countrySuffix] ?? [];
    return Column(
      children: [
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
            itemCount: news.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => NewCard(
              newsInfo: news[index].description ?? "",
              title: news[index].title ?? "",
              isNewOpend: isCardOpened,
              isOpened: _handleNewTrialerIcon,
            ),
          ),
        ),
      ],
    );
  }
}
