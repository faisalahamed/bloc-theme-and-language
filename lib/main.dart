import 'package:bloc_learing/bloc/my_main_bloc.dart';
import 'package:bloc_learing/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final stroage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: stroage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => MyMainBloc()))],
      child: BlocBuilder<MyMainBloc, MyMainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: getTheme(state.theme),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.language, ''),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }

  getTheme(String val) {
    switch (val) {
      case 'dark':
        return AppThemes.appThemeData[AppTheme.darkTheme];
      case 'light':
        return AppThemes.appThemeData[AppTheme.lightTheme];
      default:
        return AppThemes.appThemeData[AppTheme.lightTheme];
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.homePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(children: [
              ElevatedButton(
                child: const Text('En'),
                onPressed: () => context
                    .read<MyMainBloc>()
                    .add(const ChangeLanguage(language: 'en')),
              ),
              ElevatedButton(
                child: const Text('Arab'),
                onPressed: () => context
                    .read<MyMainBloc>()
                    .add(const ChangeLanguage(language: 'ar')),
              ),
              ElevatedButton(
                child: const Text('Pakistan'),
                onPressed: () => context
                    .read<MyMainBloc>()
                    .add(const ChangeLanguage(language: 'fa')),
              ),
              ElevatedButton(
                child: const Text('Hindi'),
                onPressed: () => context
                    .read<MyMainBloc>()
                    .add(const ChangeLanguage(language: 'hi')),
              ),
            ]),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // context
              //     .read<MyMainBloc>()
              //     .add(const ChangeLanguage(language: 'ar'));

              context.read<MyMainBloc>().add(const ChangeTheme(theme: 'light'));
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<MyMainBloc>().add(const ChangeTheme(theme: 'dark'));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
