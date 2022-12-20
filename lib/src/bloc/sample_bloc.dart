import 'package:bloc/bloc.dart';

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    on<SampleEvent>((event, emit) {
      print('Sample Event Called');
    });
    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}
