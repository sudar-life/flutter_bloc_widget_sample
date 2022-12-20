import 'package:bloc/bloc.dart';

class SampleSecondsBloc extends Bloc<SampleSecondsEvent, int> {
  SampleSecondsBloc() : super(0) {
    on<SampleSecondsEvent>((event, emit) {
      print('Sample Seconds Event Called');
    });
  }
}

class SampleSecondsEvent {}
