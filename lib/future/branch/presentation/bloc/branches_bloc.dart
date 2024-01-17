import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/models/branch_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/branch/domain/repositories/branchs_repository.dart';

import '../../../../common/enums/bloc_status.dart';

part 'branches_event.dart';
part 'branches_state.dart';
part 'branches_bloc.freezed.dart';

class BranchesBloc extends Bloc<BranchesEvent, BranchesState> {
  BranchRepository repository;

  // final  LoginUseCase useCase;
  BranchesBloc({required this.repository}) : super(const BranchesState()) {
    on<BranchesEvent>((event, emit) async {
      emit(state.copyWith(statusBranchs: BlocStatus.inProgress));
      final result = await repository.getBranchs();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusBranchs: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusBranchs: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusBranchs: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(state.copyWith(statusBranchs: BlocStatus.completed, branchsList: r));
        },
      );
    });
  }
}
