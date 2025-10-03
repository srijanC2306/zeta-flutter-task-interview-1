import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';
import 'package:flutter_test_cases/zeta_interview/domain/utils/api_state.dart';

class GetRecentTransactionState extends Equatable {
  final List<Result> data;
  final int page;
  final bool isLoadingMore;
  final bool isLoading;
  final String? error ; 

  const GetRecentTransactionState({
    required this.data,
    required this.page,
    this.isLoadingMore = false,
    this.isLoading = false,
    this.error 
  });

  // CopyWith for updating state immutably
  GetRecentTransactionState copyWith({
    List<Result>? data,
    int? page,
    bool? isLoadingMore,
    bool? isLoading,
    String? error ,
  }) {
    return GetRecentTransactionState(
      data: data ?? this.data,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [data, page, isLoadingMore, isLoading , error];
}
