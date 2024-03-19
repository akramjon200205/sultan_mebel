import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/models/sales_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/cart_page/domain/repositories/card_repository.dart';

part 'card_event.dart';
part 'card_state.dart';
part 'card_bloc.freezed.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository repository;
  CardBloc({required this.repository}) : super(const CardState()) {
    on<CardClientsPostEvent>((event, emit) async {
      emit(state.copyWith(statusPostSales: BlocStatus.inProgress));
      final result = await repository.postSales(
        itemsList: event.itemsList,
        branch: event.branch,      
        customer: event.customer,
        price: event.price,
      );
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusPostSales: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusPostSales: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusPostSales: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(
            state.copyWith(statusPostSales: BlocStatus.completed, clientGet: r),
          );
        },
      );
    });
  }
}
