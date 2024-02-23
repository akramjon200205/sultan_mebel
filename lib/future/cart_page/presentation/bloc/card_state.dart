part of 'card_bloc.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    @Default(BlocStatus.notInitialized) final BlocStatus statusGetSales,    
    @Default(BlocStatus.notInitialized) final BlocStatus statusPostSales,    
 
    final String? message,    
    final SalesModel? clientGet,
    

  }) = _CardState;

  const CardState._();
}