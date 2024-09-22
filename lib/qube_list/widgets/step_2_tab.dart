import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/qube_list/widgets/date_indicator.dart';
import 'package:qube_project/qube_list/widgets/details_card.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/custom_elavated_button.dart';
import 'package:qube_project/widgets/spacings.dart';

class Step2Tab extends StatelessWidget {
  const Step2Tab({
    required this.selectedQubeNotifier,
    super.key,
  });

  final ValueNotifier<QubeItem?> selectedQubeNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<QubeItem?>(
      valueListenable: selectedQubeNotifier,
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
                  const Form(
                    child: Column(
                      children: [
                        DetailsCard(hintText: nameHintText),
                        VerticalSpace(space: 12.0),
                        DetailsCard(hintText: emailHintText),
                        VerticalSpace(space: 12.0),
                        DetailsCard(hintText: phoneNumberHintText),
                      ],
                    ),
                  ),
                  const VerticalSpace(space: 16.0),
                  CustomElevatedButton(
                    label: deliverButtonLabel,
                    // TODO: Add function
                    onPress: () {},
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
