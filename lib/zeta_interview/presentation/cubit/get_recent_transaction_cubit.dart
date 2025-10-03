import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_cases/zeta_interview/domain/use_cases/get_recent_transaxtion_use_cases.dart';
import 'package:flutter_test_cases/zeta_interview/presentation/cubit/get_recent_transaction_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecentTransactionCubit extends Cubit<GetRecentTransactionState> {
  final GetRecentTransaxtionUseCases getRecentTransaxtionUseCases;

  GetRecentTransactionCubit(this.getRecentTransaxtionUseCases)
      : super(const GetRecentTransactionState(
          data: [],
          page: 1,
          isLoading: false,
          isLoadingMore: false,
        ));

  Future<void> getRecentTransaction({int results = 10, int page = 1}) async {
    // Prevent duplicate requests
    if (state.isLoading || state.isLoadingMore) return;
    
    if (page == 1) {
      emit(state.copyWith(isLoading: true, error: null));
    } else {
      emit(state.copyWith(isLoadingMore: true, error: null));
    }

    try {
      final result = await getRecentTransaxtionUseCases.call(
        result: results,
        pages: page,
      );

      if (page == 1) {
        emit(
          state.copyWith(
            data: result.results,
            page: page,
            isLoading: false,
            isLoadingMore: false,
            error: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            data: [...state.data, ...result.results],
            page: page,
            isLoading: false,
            isLoadingMore: false,
            error: null,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          error: e.toString(),
        ),
      );
    }
  }
Future<void> loadMore({int results = 10}) async {
  // Add this check to prevent duplicate calls
  if (state.isLoadingMore || state.isLoading) {
    print('Already loading, skipping loadMore');
    return;
  }
  
  print('Loading more - current page: ${state.page}');
  final nextPage = state.page + 1;
  await getRecentTransaction(results: results, page: nextPage);
}
}