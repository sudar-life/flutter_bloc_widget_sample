import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

class ContentState extends Equatable {
  final String? cid;
  final String? title;
  final String? description;
  final bool? isLiked;

  const ContentState({
    this.cid,
    this.title,
    this.description,
    this.isLiked,
  });

  @override
  List<Object?> get props => [];
}
