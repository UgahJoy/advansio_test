import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/transfer/widgets/tab_selectors.dart';
import 'package:advansio_test_mobile/shared_widgets/app_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransferAppBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onChanged;
  const TransferAppBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  State<TransferAppBar> createState() => _TransferAppBarState();
}

class _TransferAppBarState extends State<TransferAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryColor, AppColors.primaryColorGradient],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.black.withValues(alpha: 0.25),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenPadding),
                child: Column(
                  children: [
                    Gap(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppInkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            "assets/back_arrow.png",
                            height: 20,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "Transfer",
                          style: subHeaders.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Gap(20),
                      ],
                    ),
                    Gap(40),
                    Row(
                      children: [
                        Expanded(
                          child: TabSelectors(
                            image: "assets/user.png",
                            text: "Mobile",
                            onTap: () {
                              widget.onChanged(0);
                            },
                            index: 0,
                            currentIndex: widget.currentIndex,
                          ),
                        ),
                        Expanded(
                          child: TabSelectors(
                            image: "assets/bank.png",
                            text: "Bank",
                            onTap: () {
                              widget.onChanged(1);
                            },
                            index: 1,
                            currentIndex: widget.currentIndex,
                          ),
                        ),
                        Expanded(
                          child: TabSelectors(
                            image: "assets/online.png",
                            text: "Online",
                            onTap: () {
                              setState(() {
                                widget.onChanged(2);
                              });
                            },
                            index: 2,
                            currentIndex: widget.currentIndex,
                          ),
                        ),
                        Expanded(
                          child: TabSelectors(
                            image: "assets/qr_code.png",
                            text: "QR code",
                            onTap: () {
                              widget.onChanged(3);
                            },
                            index: 3,
                            currentIndex: widget.currentIndex,
                          ),
                        ),
                      ],
                    ),
                    Gap(24)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
