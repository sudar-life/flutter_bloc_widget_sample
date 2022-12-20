import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_sample.dart';

class SampleBlocDI extends Bloc<SampleDIEvent, int> {
  final RepositorySample _repositorySample;
  SampleBlocDI(this._repositorySample) : super(0) {
    on<SampleDIEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });
  }
}

class SampleDIEvent {}
