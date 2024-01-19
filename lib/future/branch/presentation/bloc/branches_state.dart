part of 'branches_bloc.dart';

@freezed
class BranchesState with _$BranchesState {
  const factory BranchesState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusBranchs,
      
    final String? message,
    final List<WereHouseModel>? branchsList,
    
  }) = _BranchesState;

  const BranchesState._();
}
