import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Bloc Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event Added: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('State Changed: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Error in Bloc: ${bloc.runtimeType}, Error: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('Bloc Closed: ${bloc.runtimeType}');
  }
}
