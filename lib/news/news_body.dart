import 'package:advansio_test_mobile/news/widget/new_card.dart';
import 'package:advansio_test_mobile/repositories/global_repository.dart';
import 'package:advansio_test_mobile/shared_state/app_state.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_loader.dart';
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
    isBusy = ref.read(appState).allNews[widget.countrySuffix]?.isEmpty ?? true;
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

  @override
  Widget build(BuildContext context) {
    var news = ref.watch(appState).allNews[widget.countrySuffix] ?? [];
    var searchedNews = (ref.read(appState).allNews[widget.countrySuffix] ?? [])
        .where((val) => (val.title?.toLowerCase() ?? "")
            .contains(searchHelpController.text.toLowerCase()))
        .toList();
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
          child: isBusy
              ? Center(
                  child: AppLoader(),
                )
              : news.isEmpty
                  ? Center(
                      child: Text(
                        "Unable to Load News",
                        style: subHeaders.copyWith(fontWeight: FontWeight.w700),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchedNews.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => NewCard(
                        newsInfo: searchedNews[index].description ?? "",
                        title: searchedNews[index].title ?? "",
                      ),
                    ),
        ),
      ],
    );
  }
}
