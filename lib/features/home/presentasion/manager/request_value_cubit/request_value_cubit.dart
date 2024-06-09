import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_value_state.dart';

class RequestValueCubit extends Cubit<RequestValueState> {
  RequestValueCubit() : super(RequestValueInitial());

  void changeValue({String requestValue = 'popular'}) {
    if (requestValue == 'upComing') {
      emit(RequestValueUpComingSuccessState());
    } else if (requestValue == 'popular') {
      emit(RequestValuePopularSuccessState());
    }
  }
}
