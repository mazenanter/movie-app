import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRepoImpl) : super(PopularInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchPopularMovies() async {
    emit(PopularLoadingState());
    var data = await homeRepoImpl.fetchPopularMovies();
    return data.fold(
      (failure) => emit(PopularErrorState(failure.errMsg)),
      (movies) => emit(
        PopularSuccessState(movies),
      ),
    );
  }
}
