
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/products/data/model/branch_model.dart';
import 'package:sultan_mebel/future/products/data/model/warehouse_items_model.dart';
import 'package:sultan_mebel/future/products/domain/repositories/products_repositories.dart';

import '../../../../../common/enums/bloc_status.dart';
import '../../../../../common/models/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsRepositories repository;
  ProductsBloc({required this.repository}) : super(const ProductsState()) {
    on<ProductsEvent>((event, emit) async {
      emit(state.copyWith(statusGetProductCategory: BlocStatus.inProgress));
      final result = await repository.getProductsOfWarehouse(event.idCategory, event.idWarehouse);
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

    on<ProductPostEvent>((event, emit) async {
      emit(state.copyWith(statusPostProductCategory: BlocStatus.inProgress));
      final result = await repository.postProcduct(
        event.productName,
        event.productCategoryId!,
        event.productSize,
        event.productPrice,
      );
      result.fold(
        (l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusPostProductCategory: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusPostProductCategory: BlocStatus.unAutorized, message: l.message));
          }
          emit(
            state.copyWith(statusPostProductCategory: BlocStatus.failed, message: l.message),
          );
        },
        (r) {
          List<WarehouseItemsModel> list = [];
          list.addAll(state.productsList ?? []);
          emit(
            state.copyWith(
              statusPostProductCategory: BlocStatus.completed,
              productsList: list,
              productsModel: r,
            ),
          );
        },
      );
    });
  }
}
