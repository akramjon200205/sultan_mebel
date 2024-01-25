import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/product/domain/repositories/product_repository.dart';

import '../../../../common/enums/bloc_status.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;
  ProductBloc({required this.repository}) : super(const ProductState()) {
    on<ProductEvent>((event, emit) async {
      emit(state.copyWith(statusGetProduct: BlocStatus.inProgress));
      final result = await repository.getProduct(event.id);
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusGetProduct: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusGetProduct: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusGetProduct: BlocStatus.failed, message: l.message),
          );
        },
        (r) {},
      );
    });
  }
}
