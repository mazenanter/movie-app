import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepoImpl) : super(SearchInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> searchMovies({required String query}) async {
    emit(SearchLoading());
    var data = await homeRepoImpl.searchMovies(query: query);
    data.fold(
      (failure) => emit(SearchError(failure.errMsg)),
      (movies) => emit(
        SearchSuccess(movies),
      ),
    );
  }
}
