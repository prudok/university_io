import 'package:education_portal/config/config.dart';
import 'package:education_portal/features/data/repositories_impl/repositories_impl.dart';
import 'package:education_portal/features/presentation/student/bloc/student_bloc.dart';
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TeacherBloc(getIt<TeacherRepositoryImpl>())..add(TeacherLoad()),
        ),
        BlocProvider(
          create: (_) => StudentBloc(getIt<StudentRepositoryImpl>())..add(StudentLoad()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(),
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}
