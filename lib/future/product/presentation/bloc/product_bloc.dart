// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/core/error/failure.dart';
import 'package:sultan_mebel/future/product/domain/repositories/product_repository.dart';
import 'package:sultan_mebel/future/products/data/model/warehouse_items_model.dart';
import 'package:sultan_mebel/future/products/domain/repositories/products_repositories.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/products/products_bloc.dart';

import '../../../../common/enums/bloc_status.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;

  ProductBloc({
    required this.repository,
  }) : super(const ProductState()) {
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
        (r) {
          emit(
            state.copyWith(statusGetProduct: BlocStatus.completed, productsModel: r),
          );
        },
      );
    });
    on<ProductPostEvent>(
      (event, emit) async {
        emit(
          state.copyWith(statusPostProduct: BlocStatus.inProgress),
        );
        final result = await repository.postProduct(
          event.name,
          event.price,
          event.sizes,
          event.category,
          event.idproduct,
        );
        result.fold((l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusPostProduct: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusPostProduct: BlocStatus.unAutorized, message: l.message));
          }
          emit(state.copyWith(statusPostProduct: BlocStatus.failed, message: l.message));
        }, (r) {
          emit(
            state.copyWith(
              statusPostProduct: BlocStatus.completed,
              productsModel: r,
            ),
          );
        });
      },
    );

    on<ProductPutAmount>(
      (event, emit) async {
        emit(
          state.copyWith(statusPutAmount: BlocStatus.inProgress),
        );
        final result = await repository.putAmount(
          event.idWareHouse,
          event.amount,
          event.idProduct,
        );
        result.fold((l) {
          if (l is ConnectionFailure) {
            emit(
              state.copyWith(statusPutAmount: BlocStatus.connectionFailed, message: l.message),
            );
          } else if (l is UnautorizedFailure) {
            emit(state.copyWith(statusPutAmount: BlocStatus.unAutorized, message: l.message));
          }
          emit(state.copyWith(statusPutAmount: BlocStatus.failed, message: l.message));
        }, (r) {
          var list = state.productsModel;
          emit(
            state.copyWith(
              statusPutAmount: BlocStatus.completed,
              productsModel: list,
              putAmount: r,
            ),
          );
        });
      },
    );
  }
}
