import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit(this.homeRepoImpl) : super(UpcomingInitial());
  HomeRepoImpl homeRepoImpl;

  Future<void> fetchUpComingMovies() async {
    emit(UpcomingLoadingState());
    var data = await homeRepoImpl.fetchUpComingMovies();
    return data.fold(
      (failure) => emit(UpcomingErrorState(failure.errMsg)),
      (movies) => emit(UpcomingSuccessState(movies)),
    );
  }
}
