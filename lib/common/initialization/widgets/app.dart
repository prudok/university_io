import 'package:education_portal/common/themes/uni_theme.dart';
import 'package:education_portal/config/config.dart';
import 'package:education_portal/features/domain/entities/teacher.dart';
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData _theme = ThemeData.light(useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return UniTheme(
        onThemeUpdated: (theme) => setState(() => _theme = theme),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => TeacherBloc()
                ..add(TeacherAdd(
                  teacher: Teacher(
                    id: 0,
                    firstName: '',
                    lastName: '',
                    email: '',
                  ),
                )),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: getIt<AppRouter>().config(),
            theme: _theme,
          ),
        ));
  }
}
