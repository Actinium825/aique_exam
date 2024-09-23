import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/models/qube_details.dart';
import 'package:qube_project/qube_list/widgets/date_indicator.dart';
import 'package:qube_project/qube_list/step_2/widgets/details_field.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/custom_elavated_button.dart';
import 'package:qube_project/widgets/spacings.dart';

class Step2Tab extends StatefulWidget {
  const Step2Tab({
    required this.selectedQubeNotifier,
    required this.isLoading,
    required this.onDeliver,
    super.key,
  });

  final ValueNotifier<QubeItem?> selectedQubeNotifier;
  final bool isLoading;
  final VoidCallback onDeliver;

  @override
  State<Step2Tab> createState() => _Step2TabState();
}

class _Step2TabState extends State<Step2Tab> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<QubeDetails> _qubeDetailsNotifier;
  late final TextEditingController _nameTextController;
  late final TextEditingController _emailTextController;
  late final TextEditingController _phoneTextController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _qubeDetailsNotifier = ValueNotifier(const QubeDetails());
    _nameTextController = TextEditingController()..addListener(_onUpdateName);
    _emailTextController = TextEditingController()..addListener(_onUpdateEmail);
    _phoneTextController = TextEditingController()..addListener(_onUpdatePhone);
    super.initState();
  }

  @override
  void dispose() {
    _qubeDetailsNotifier.dispose();
    _nameTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  /// Updates the name text of the inputted details
  void _onUpdateName() =>
      _qubeDetailsNotifier.value = _qubeDetailsNotifier.value.copyWith(name: _nameTextController.text);

  /// Updates the email text of the inputted details
  void _onUpdateEmail() =>
      _qubeDetailsNotifier.value = _qubeDetailsNotifier.value.copyWith(email: _emailTextController.text);

  /// Updates the phone text of the inputted details
  void _onUpdatePhone() =>
      _qubeDetailsNotifier.value = _qubeDetailsNotifier.value.copyWith(phone: _phoneTextController.text);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<QubeItem?>(
      valueListenable: widget.selectedQubeNotifier,
      builder: (_, selectedQube, __) {
        final deliveryDate = selectedQube?.deliveryDate ?? DateTime.now();
        return Column(
          children: [
            DateIndicator(date: DateFormat(dateIndicatorFormat).format(deliveryDate)),
            const VerticalSpace(space: 16.0),
            Container(
              padding: qubeCardPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(qubeCardRadius),
                color: qubeCardBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.jm().format(deliveryDate),
                    style: TextStyles.xxs,
                  ),
                  const VerticalSpace(space: 4.0),
                  Text(
                    enterDetailsHeader,
                    style: TextStyles.base,
                  ),
                  const VerticalSpace(space: 16.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DetailsField(
                          hintText: nameHintText,
                          textEditingController: _nameTextController,
                          isEnabled: !widget.isLoading,
                        ),
                        const VerticalSpace(space: 12.0),
                        DetailsField(
                          hintText: emailHintText,
                          keyboardType: TextInputType.emailAddress,
                          textEditingController: _emailTextController,
                          isEnabled: !widget.isLoading,
                        ),
                        const VerticalSpace(space: 12.0),
                        DetailsField(
                          hintText: phoneNumberHintText,
                          keyboardType: TextInputType.phone,
                          textEditingController: _phoneTextController,
                          isEnabled: !widget.isLoading,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(space: 16.0),
                  ValueListenableBuilder<QubeDetails>(
                    valueListenable: _qubeDetailsNotifier,
                    builder: (_, qubeDetails, __) {
                      final areDetailsFilled =
                          qubeDetails.name.isNotEmpty && qubeDetails.email.isNotEmpty && qubeDetails.phone.isNotEmpty;
                      return CustomElevatedButton(
                        label: widget.isLoading ? postingLabel : deliverButtonLabel,
                        onPress: widget.isLoading || !areDetailsFilled ? null : widget.onDeliver,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
