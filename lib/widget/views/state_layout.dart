
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/config/base/app_exeption.dart';
import 'package:recruit_app/widget/views/empty_view.dart';
import 'package:recruit_app/widget/views/loading_only.dart';
import 'package:recruit_app/widget/views/state_error_view.dart';

enum StateLayout { showContent, showLoading, showError, showEmpty }

class StateFullLayout extends StatelessWidget {
  final StateLayout _stateLayout;
  final Widget _child;
  final String? title;
  final AppException _error;
  final Function() _retry;
  final dynamic _textEmpty;

  const StateFullLayout({
    Key? key,
    required StateLayout stateLayout,
    required Widget child,
    required AppException error,
    required Function() retry,
    required dynamic textEmpty,
    this.title,
  })  : _stateLayout = stateLayout,
        _error = error,
        _child = child,
        _retry = retry,
        _textEmpty = textEmpty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_stateLayout == StateLayout.showError) {
      return StateErrorView(
        _error.message,
        _retry,
        title: title,
      );
    }
    if (_stateLayout == StateLayout.showEmpty) {
      if (_textEmpty is Widget) return _textEmpty as Widget;
      return EmptyView(message: _textEmpty.toString());
    }
    return ModalProgressHUD(
      inAsyncCall: _stateLayout == StateLayout.showLoading,
      progressIndicator: const CircularProgressIndicator.adaptive(),
      child: _child,
    );
  }
}
