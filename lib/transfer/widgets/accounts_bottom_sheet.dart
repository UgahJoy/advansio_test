// ignore_for_file: must_be_immutable

import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/shared_widgets/app_divider.dart';
import 'package:advansio_test_mobile/shared_widgets/app_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountsBottomSheet extends StatelessWidget {
  AccountsBottomSheet({super.key});
  List<String> amounts = ["N1,000.00", "N50,000.00", "N10,000.00"];
  final String _accountNumber = "02334457689";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenPadding, vertical: 20),
      height: context.deviceHeight * 0.4,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Account",
            style: subHeaders.copyWith(
              fontSize: 18,
            ),
          ),
          Gap(context.deviceHeight * 0.06),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Accounts(
                accountNumber: _accountNumber,
                onTap: () => Navigator.pop(context, {
                  'accountNumber': _accountNumber,
                  'amount': amounts[index],
                }),
                amount: amounts[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Accounts extends StatelessWidget {
  final String amount;
  final Function() onTap;
  final String accountNumber;
  const Accounts({
    super.key,
    required this.amount,
    required this.onTap,
    required this.accountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                accountNumber,
                style: subHeaders.copyWith(
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Text(
                "-",
                style: subHeaders.copyWith(
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  amount,
                  style: subHeaders.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          AppDivider(topMargin: 20, bottomMargin: 20),
        ],
      ),
    );
  }
}
