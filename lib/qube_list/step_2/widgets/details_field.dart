import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_point.dart';

class DetailsField extends StatefulWidget {
  const DetailsField({
    required this.hintText,
    required this.textEditingController,
    this.keyboardType,
    super.key,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;

  @override
  State<DetailsField> createState() => _DetailsFieldState();
}

class _DetailsFieldState extends State<DetailsField> {
  late final ValueNotifier<bool> _isErrorNotifier;

  @override
  void initState() {
    _isErrorNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _isErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(detailsCardRadius),
      borderSide: BorderSide(
        width: detailsCardBorderWidth,
        color: Colors.white.withOpacity(0.3),
      ),
    );
    final errorBorder = border.copyWith(borderSide: errorFieldBorderSide);

    return SizedBox(
      height: detailsCardHeight,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        style: TextStyles.xxs,
        decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          prefixIcon: ValueListenableBuilder<bool>(
            valueListenable: _isErrorNotifier,
            builder: (_, isError, __) => Container(
              margin: detailsCardPrefixMargin,
              foregroundDecoration: isError
                  ? const BoxDecoration(
                      color: errorFieldColor,
                      shape: BoxShape.circle,
                    )
                  : null,
              child: const GradientPoint(),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyles.xxs,
          errorStyle: const TextStyle(fontSize: 0),
        ),
        validator: (value) {
          _isErrorNotifier.value = value?.isEmpty == true;
          return _isErrorNotifier.value ? '' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
