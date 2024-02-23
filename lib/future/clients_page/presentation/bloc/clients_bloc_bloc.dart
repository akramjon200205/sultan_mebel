import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/clients_page/domain/repositories/clients_repositories.dart';

part 'clients_bloc_bloc.freezed.dart';
part 'clients_bloc_event.dart';
part 'clients_bloc_state.dart';

class ClientsBloc extends Bloc<ClientsBlocEvent, ClientsState> {
  ClientsRepositories repository;

  // final  LoginUseCase useCase;
  ClientsBloc({required this.repository}) : super(const ClientsState()) {
    on<ClientsBlocEvent>((event, emit) async {
      emit(state.copyWith(statusGetClients: BlocStatus.inProgress));
      final result = await repository.clients();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusGetClients: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusGetClients: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusGetClients: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusGetClients: BlocStatus.completed, clientsList: r),
          );
        },
      );
    });
    on<ClientsPostEvent>((event, emit) async {
      emit(state.copyWith(statusPostClients: BlocStatus.inProgress));
      final result = await repository.postClients(
        firstName: event.firstName,
        lastName: event.lastName,
        phone: event.phone,
        address: event.address,
      );
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusPostClients: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusPostClients: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusPostClients: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          List<CustomerModel> list = [];
          list.addAll(state.clientsList ?? []);
          list.add(r);
          emit(
            state.copyWith(statusGetClients: BlocStatus.completed, clientsList: list, clientPost: r),
          );
        },
      );
    });
  }
}
