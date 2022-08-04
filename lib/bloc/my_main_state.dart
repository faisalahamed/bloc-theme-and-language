// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'my_main_bloc.dart';

class MyMainState extends Equatable {
  final String language;
  final String theme;
  const MyMainState({required this.language, required this.theme});

  @override
  List<Object> get props => [language, theme];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'theme': theme,
    };
  }

  factory MyMainState.fromMap(Map<String, dynamic> map) {
    return MyMainState(
      language: map['language'] as String,
      theme: map['theme'] as String,
    );
  }
}

class MyMainInitial extends MyMainState {
  const MyMainInitial({required super.language, required super.theme});
}

class SetMyMainState extends MyMainState {
  const SetMyMainState({required super.language, required super.theme});
  //  final String language, theme;
  // const SetMyMainState({required this.language, required this.theme}) : super(language: language, theme: theme);
}
