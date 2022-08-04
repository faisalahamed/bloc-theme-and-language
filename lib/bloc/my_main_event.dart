// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_main_bloc.dart';

abstract class MyMainEvent extends Equatable {
  const MyMainEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends MyMainEvent {
  final String language;
  const ChangeLanguage({
    required this.language,
  });
}

class ChangeTheme extends MyMainEvent {
  final String theme;
  const ChangeTheme({
    required this.theme,
  });
}
