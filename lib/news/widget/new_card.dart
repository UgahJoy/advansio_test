import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final Function(bool)? isOpened;
  final String title;
  final String newsInfo;
  final bool isNewOpend;
  const NewCard({
    super.key,
    required this.isOpened,
    required this.isNewOpend,
    required this.newsInfo,
    required this.title,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          collapsedShape: Border.all(
            width: 1,
            color: AppColors.offWhite.withValues(alpha: 0.2),
          ),
          shape: Border.all(color: AppColors.white),
          collapsedBackgroundColor: AppColors.offWhite,
          backgroundColor: AppColors.phoneNumberGrey.withValues(alpha: 0.2),
          title: Text(
            title,
            style: subHeaders.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: isNewOpend
              ? Icon(Icons.expand_less_outlined, color: AppColors.blue)
              : Image.asset(
                  "assets/expand_more.png",
                  height: 7,
                  color: AppColors.blue,
                ),
          onExpansionChanged: isOpened,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(textAlign: TextAlign.start, newsInfo)],
            ),
          ],
        ),
      ),
    );
  }
}
