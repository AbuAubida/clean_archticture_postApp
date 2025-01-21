import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/core/strings/failures.dart';

String getFailureMessege(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure():
      return SERVER_FAILURE_MESSAGE;
    case NoInternetConnectionFailure():
      return OFFLINE_FAILURE_MESSAGE;
    case CasheDataFailure():
      return EMPTY_CACHE_FAILURE_MESSAGE;

    default:
      return "Unexpected Error ! , Please try again later .";
  }
}
