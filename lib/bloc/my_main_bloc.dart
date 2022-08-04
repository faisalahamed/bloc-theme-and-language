import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'my_main_event.dart';
part 'my_main_state.dart';

class MyMainBloc extends HydratedBloc<MyMainEvent, MyMainState> {
  MyMainBloc() : super(const MyMainInitial(language: 'en', theme: 'light')) {
    on<ChangeLanguage>((event, emit) {
      emit(SetMyMainState(language: event.language, theme: state.theme));
    });
    on<ChangeTheme>((event, emit) {
      emit(SetMyMainState(language: state.language, theme: event.theme));
    });
  }

  @override
  MyMainState? fromJson(Map<String, dynamic> json) {
    return MyMainState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(MyMainState state) {
    return state.toMap();
  }
}
