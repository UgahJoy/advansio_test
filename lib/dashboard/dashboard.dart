// ignore_for_file: deprecated_member_use

import 'package:advansio_test_mobile/dashboard/widgets/activity_action_items.dart';
import 'package:advansio_test_mobile/dashboard/widgets/dashboar_header.dart';
import 'package:advansio_test_mobile/dashboard/widgets/verification_card.dart';
import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/news/news_screen.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/transfer/transfer.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<ActivityActionItems> actionItems;

  @override
  Widget build(BuildContext context) {
    actionItems = [
      ActivityActionItems(
        color: AppColors.primaryColor,
        image: "assets/transfer.png",
        text: "Transfer",
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Transfer()),
        ),
      ),
      ActivityActionItems(
        isLast: false,
        color: AppColors.darkPrimaryColor,
        image: "assets/news.png",
        text: "News",
        imageHeight: 45,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsScreen()),
        ),
      ),
      ActivityActionItems(
        color: AppColors.yellow,
        image: "assets/card.png",
        text: "My Card",
        onTap: () {},
      ),
      ActivityActionItems(
        color: AppColors.loanGreen,
        image: "assets/pay_laon.png",
        text: "Pay Loan",
        onTap: () {},
      ),
    ];
    final double overlapAmount = context.deviceHeight * 0.13;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AppScaffold(
        safeAreaTop: false,
        scaffoldPadding: 0,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            DashboarHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: overlapAmount),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Activity",
                          style: subHeaders.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Gap(20),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: actionItems.length,
                            itemBuilder: (context, index) => actionItems[index],
                          ),
                        ),
                        Gap(28),
                        Text(
                          "Complete Verification",
                          style: subHeaders.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Gap(12),
                        VerifciationCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
