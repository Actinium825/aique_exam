import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/models/qube_details.dart';
import 'package:qube_project/models/qube_details_form.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class Step2TabVmFactory extends VmFactory<AppState, Step2TabConnector, Step2TabVM> {
  @override
  Step2TabVM fromStore() => Step2TabVM(
        isLoading: state.wait.isWaiting(DeliverAction.waitKey),
        onDeliver: _onDeliver,
        isSuccessful: state.isSuccessful,
        selectedQube: state.selectedQube,
        onUpdateForm: _onUpdateForm,
        qubeDetails: state.qubeDetails ?? const QubeDetails(),
      );

  void _onDeliver() => dispatch(DeliverAction());

  void _onUpdateForm(QubeDetailsForm qubeDetailsForm) {
    final qubeDetails = state.qubeDetails ?? const QubeDetails();
    final updatedQubeDetails = qubeDetailsForm.when(
      name: (name) => qubeDetails.copyWith(name: name),
      email: (email) => qubeDetails.copyWith(email: email),
      phone: (phone) => qubeDetails.copyWith(phone: phone),
    );

    dispatch(UpdateQubeDetailsAction(updatedQubeDetails: updatedQubeDetails));
  }
}

class Step2TabVM extends Vm {
  final bool isLoading;
  final VoidCallback onDeliver;
  final ValueChanged<QubeDetailsForm> onUpdateForm;
  final QubeDetails qubeDetails;
  final bool? isSuccessful;
  final QubeItem? selectedQube;

  Step2TabVM({
    required this.selectedQube,
    required this.qubeDetails,
    required this.isLoading,
    required this.onDeliver,
    required this.isSuccessful,
    required this.onUpdateForm,
  }) : super(
          equals: [
            selectedQube,
            qubeDetails,
            isLoading,
            isSuccessful,
          ],
        );
}
