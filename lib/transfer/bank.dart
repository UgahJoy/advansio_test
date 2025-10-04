import 'package:advansio_test_mobile/auth/set_pin.dart';
import 'package:advansio_test_mobile/auth/success_page.dart';
import 'package:advansio_test_mobile/dashboard/dashboard.dart';
import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/transfer/widgets/accounts_bottom_sheet.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  final accountController = TextEditingController();
  final amountController = TextEditingController();
  final accoutNoController = TextEditingController();
  final recieptController = TextEditingController();
  final narrationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          Text(
            "Enter transfer details",
            style: subHeaders.copyWith(
              fontSize: 18,
            ),
          ),
          Gap(24),
          AppTextfield(
            onChanged: (val) {},
            suffixIcon: Image.asset("assets/expand_more.png", height: 12),
            controller: accountController,
            hintText: "Select Account",
            readOnly: true,
            onTap: () async {
              var response = await showModalBottomSheet(
                barrierColor: AppColors.black.withValues(alpha: 0.2),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(30),
                ),
                backgroundColor: AppColors.white,
                context: context,
                builder: (context) => AccountsBottomSheet(),
              );
              if (response == null) {
                return;
              }
              amountController.text = response["amount"];
              accoutNoController.text = response["accountNumber"];
              setState(() {});
            },
          ),
          Gap(24),
          AppTextfield(
            readOnly: true,
            controller: amountController,
            hintText: "Enter Amount",
          ),
          Gap(24),
          AppTextfield(
            readOnly: true,
            controller: accoutNoController,
            hintText: "Enter Recipient Account No.",
          ),
          Gap(24),
          AppTextfield(
            readOnly: true,
            suffixIcon: Image.asset("assets/expand_more.png", height: 12),
            controller: recieptController,
            hintText: "Select Recipient Bank",
          ),
          Gap(24),
          AppTextfield(controller: narrationController, hintText: "Narration"),
          Gap(context.deviceHeight * 0.1),
          AppButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SetPin(
                  showBackButton: true,
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        ),
                        title: "Transfer completed successfully!",
                        message: "Thanks for choosing us",
                      ),
                    ),
                  ),
                  title: "Enter your PIN",
                  message: "Confirm transfer of ${amountController.text}",
                  buttonText: "Confirm",
                ),
              ),
            ),
            instrcuction: "Proceed",
          ),
        ],
      ),
    );
  }
}
