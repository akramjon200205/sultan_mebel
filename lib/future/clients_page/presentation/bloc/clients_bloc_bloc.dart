
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/client_page/domain/repositories/clients_repositories.dart';

part 'clients_bloc_bloc.freezed.dart';
part 'clients_bloc_event.dart';
part 'clients_bloc_state.dart';

class ClientsBloc extends Bloc<ClientsBlocEvent, ClientsBlocState> {
  ClientsRepositories repository;

  // final  LoginUseCase useCase;
  ClientsBloc({required this.repository}) : super(const ClientsBlocState()) {
    on<ClientsBlocEvent>((event, emit) async {
      emit(state.copyWith(statusClients: BlocStatus.inProgress));
      final result = await repository.clients();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(
                  statusClients: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(
                statusClients: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusClients: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusClients: BlocStatus.completed, clientsList: r),
          );
        },
      );
    });
  }
}
