import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruit_app/widget/views/state_layout.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseCubit<BaseSatate> extends BlocBase<BaseSatate> {
  BaseCubit(BaseSatate state) : super(state);

  final BehaviorSubject<StateLayout> _state =
      BehaviorSubject<StateLayout>.seeded(StateLayout.showLoading);

  Stream<StateLayout> get streamState => _state.stream;

  void showLoading() {
    _state.wellAdd(StateLayout.showLoading);
  }

  void showError() {
    _state.wellAdd(StateLayout.showError);
  }

  void showEmpty() {
    _state.wellAdd(StateLayout.showEmpty);
  }

  void showContent() {
    _state.wellAdd(StateLayout.showContent);
  }
}

extension Bell<T> on Subject<T> {
  void wellAdd(T data) {
    if (isClosed) return;
    add(data);
  }
}
