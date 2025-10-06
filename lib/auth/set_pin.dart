import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/shared_state/app_state.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/shared_widgets/app_alert.dart';
import 'package:advansio_test_mobile/shared_widgets/app_back_button.dart';
import 'package:advansio_test_mobile/shared_widgets/app_button.dart';
import 'package:advansio_test_mobile/shared_widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/shared_widgets/custome_key_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SetPin extends ConsumerStatefulWidget {
  final String title;
  final String message;
  final String buttonText;
  final Function(String) onTap;
  final bool showBackButton;
  const SetPin({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
    this.showBackButton = false,
    required this.buttonText,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetPinState();
}

class _SetPinState extends ConsumerState<SetPin> {
  final focusNode = FocusNode();
  final keyController = TextEditingController();
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showBackButton) ...[Gap(28), AppBackButton()],
          Gap(
            widget.showBackButton
                ? context.deviceHeight * 0.07
                : context.deviceHeight * 0.12,
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              widget.title,
              style: header.copyWith(
                fontSize: 26,
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(widget.message, style: TextStyle(fontSize: 12)),
          ),
          Gap(context.deviceHeight * 0.04),
          CustomeKeyPad(
            onCompleted: (val) {
              widget.onTap(val);
              setState(() {});
            },
            onchanged: (val) {
              pin = val;
              setState(() {});
            },
            controller: keyController,
            focusNode: focusNode,
          ),
          Gap(28),
          AppButton(
              onPressed: () async {
                if (pin.length != 4) {
                  AppAlerts.showError("Pin too short...");
                  return;
                }
                var currentUser = ref.read(appState).currentLogedInUser;
                var currentUserPin = currentUser!.pin == pin;
                if (currentUserPin) {
                  widget.onTap(pin);
                  return;
                }
                AppAlerts.showError("Incorrect pin...");
                return;
              },
              instrcuction: widget.buttonText),
        ],
      ),
    );
  }
}
