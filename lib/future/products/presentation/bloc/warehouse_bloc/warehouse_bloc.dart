import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/future/products/domain/repositories/warehouse_repositories.dart';

import '../../../../../common/enums/bloc_status.dart';
import '../../../../../core/error/failure.dart';
import '../../../data/model/branch_model.dart';

part 'warehouse_event.dart';
part 'warehouse_state.dart';
part 'warehouse_bloc.freezed.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  WarehouseRepository repository;
  WarehouseBloc({required this.repository}) : super(const WarehouseState()) {
    on<WarehouseEvent>((event, emit) async {
      emit(state.copyWith(statusGetWarehouse: BlocStatus.inProgress));
      final result = await repository.getBranchsList();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusGetWarehouse: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusGetWarehouse: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusGetWarehouse: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          List<String> list = [];
          for (var element in r) {
            list.add(element.branch?.name ?? '');
          }
          emit(state.copyWith(
            statusGetWarehouse: BlocStatus.completed,
            branchList: r,
            branchNames: list,
          ));
        },
      );
    });
  }
}
