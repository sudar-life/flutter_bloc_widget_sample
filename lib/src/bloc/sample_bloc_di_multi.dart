import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_sample.dart';
import 'package:flutter_bloc_widget_sample/src/repository/repository_seconds_sample.dart';

class SampleBlocDIMulti extends Bloc<SampleDiMultiEvent, int> {
  final RepositorySample _repositorySample;
  final RepositorySecondSample _repositorySecondSample;
  SampleBlocDIMulti(this._repositorySample, this._repositorySecondSample)
      : super(0) {
    on<SampleDiFirstEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });
    on<SampleDiSecondEvent>((event, emit) async {
      var data = await _repositorySecondSample.load();
      emit(data);
    });
  }
}

abstract class SampleDiMultiEvent {}

class SampleDiFirstEvent extends SampleDiMultiEvent {}

class SampleDiSecondEvent extends SampleDiMultiEvent {}
