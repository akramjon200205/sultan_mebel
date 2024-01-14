
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/enums/bloc_status.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/login_repositories.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;

  // final  LoginUseCase useCase;
  LoginBloc({required this.repository}) : super(const LoginState()) {
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(statusLogin: BlocStatus.inProgress));
      final result = await repository.login(event.number, event.password);
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(
                  statusLogin: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(
                statusLogin: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusLogin: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusLogin: BlocStatus.completed, message: r),
          );
        },
      );
    });
  }
}
