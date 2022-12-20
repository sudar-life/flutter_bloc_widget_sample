import 'package:bloc/bloc.dart';

class BlocSelectorBloc extends Bloc<BlocSelectorEvent, BlocSelectorState> {
  BlocSelectorBloc() : super(BlocSelectorState()) {
    on<ChangeStateEvent>((event, emit) {
      emit(state.clone(changeState: !state.changeState));
    });
    on<ValueEvent>((event, emit) {
      emit(state.clone(value: state.value + 1));
    });
  }
}

abstract class BlocSelectorEvent {}

class ChangeStateEvent extends BlocSelectorEvent {}

class ValueEvent extends BlocSelectorEvent {}

class BlocSelectorState {
  final bool changeState;
  final int value;
  BlocSelectorState({this.changeState = false, this.value = 0});

  BlocSelectorState clone({
    bool? changeState,
    int? value,
  }) {
    return BlocSelectorState(
      changeState: changeState ?? this.changeState,
      value: value ?? this.value,
    );
  }
}
