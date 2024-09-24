import 'package:freezed_annotation/freezed_annotation.dart';

part 'qube_details_form.freezed.dart';

@freezed
class QubeDetailsForm with _$QubeDetailsForm {
  const factory QubeDetailsForm.name(String name) = _Name;
  const factory QubeDetailsForm.email(String email) = _Email;
  const factory QubeDetailsForm.phone(String phone) = _Phone;
}
