import 'package:flutter/material.dart';
import 'package:recruit_app/widget/state_stream_layout/model_progess_hud.dart';

enum StateLayout { showLoading, showContent, showError, showEmpty }

class ShowStateWidget extends StatelessWidget {
  final Stream<StateLayout> streamState;
  final Function() retry;
  final Widget child;

  const ShowStateWidget({
    Key? key,
    required this.streamState,
    required this.retry,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateLayout>(
        stream: streamState,
        builder: (context, snapshot) {
          final data = snapshot.data ?? StateLayout.showLoading;

          if (data == StateLayout.showError) {
            ///TODO
          }

          if (data == StateLayout.showEmpty) {
            return _empty();
          }

          return ModalProgressHUD(
            isAsyncCall: data == StateLayout.showLoading,
            progessIndicator: const CircularProgressIndicator.adaptive(),
            child: child,
          );
        });
  }

  Widget _empty() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: const Text(
        'Không có dữ liệu',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
