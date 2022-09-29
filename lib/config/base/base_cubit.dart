import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruit_app/widget/state_stream_layout/show_state_widget.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseCubit<BaseSatate> extends BlocBase<BaseSatate> {
  BaseCubit(BaseSatate state) : super(state);

  final BehaviorSubject<StateLayout> _state =
      BehaviorSubject<StateLayout>.seeded(StateLayout.showLoading);

  void showLoading() {
    _state.add(StateLayout.showLoading);
  }

  void showError() {
    _state.add(StateLayout.showError);
  }

  void showEmpty() {
    _state.add(StateLayout.showEmpty);
  }

  void showContent() {
    _state.add(StateLayout.showContent);
  }
}
