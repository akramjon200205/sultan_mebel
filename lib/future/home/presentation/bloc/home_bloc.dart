import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/home/data/models/category_model.dart';
import 'package:sultan_mebel/future/home/domain/repositories/category_repositories.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  CategoryRepository repository;

  // final  LoginUseCase useCase;
  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      emit(state.copyWith(statusCategory: BlocStatus.inProgress));
      final result = await repository.getCatgories();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusCategory: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusCategory: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusCategory: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusCategory: BlocStatus.completed, categoryList: r),
          );
        },
      );
    });
  }
}
