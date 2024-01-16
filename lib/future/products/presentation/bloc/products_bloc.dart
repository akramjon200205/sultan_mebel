
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/products/domain/repositories/products_repositories.dart';

import '../../../../common/enums/bloc_status.dart';
import '../../../home/data/models/category_model.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductRepositories repository;
  ProductsBloc({required this.repository}) : super(const ProductsState()) {
    on<ProductsEvent>((event, emit) async {
      emit(state.copyWith(statusGetProductCategory: BlocStatus.inProgress));
      final result = await repository.getProductsList(event.id);
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusGetProductCategory: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusGetProductCategory: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusGetProductCategory: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          emit(state.copyWith(statusGetProductCategory: BlocStatus.completed, productsList: r));
        },
      );
    });
   
  }
}
