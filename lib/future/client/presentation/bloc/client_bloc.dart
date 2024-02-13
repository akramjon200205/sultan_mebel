import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/models/customer_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/client/domain/repositories/client_repositories.dart';

part 'client_event.dart';
part 'client_state.dart';
part 'client_bloc.freezed.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientRepositories repository;

  // final  LoginUseCase useCase;
  ClientBloc({required this.repository}) : super(const ClientState()) {
    on<ClientEvent>((event, emit) async {
      emit(state.copyWith(statusGetClient: BlocStatus.inProgress));
      final result = await repository.getClient();
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusGetClient: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusGetClient: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusGetClient: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusGetClient: BlocStatus.completed, clientGet: r),
          );
        },
      );
    });
  }
}
