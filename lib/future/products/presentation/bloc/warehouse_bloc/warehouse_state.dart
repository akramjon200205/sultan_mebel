part of 'warehouse_bloc.dart';


@freezed
class WarehouseState with _$WarehouseState {
  const factory WarehouseState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetWarehouse,
  
    final String? message,   
    final List<BranchModel>? branchList,    
    final List<String>? branchNames,    
  }) = _WarehouseState;

  const WarehouseState._();
}
