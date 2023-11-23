import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/config/config.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';
import 'package:university_io/features/presentation/book/bloc/book_bloc.dart';
import 'package:university_io/features/presentation/classroom/bloc/classroom_bloc.dart';
import 'package:university_io/features/presentation/department/bloc/department_bloc.dart';
import 'package:university_io/features/presentation/event/bloc/event_bloc.dart';
import 'package:university_io/features/presentation/library/bloc/library_bloc.dart';
import 'package:university_io/features/presentation/mark/bloc/mark_bloc.dart';
import 'package:university_io/features/presentation/project/bloc/project_bloc.dart';
import 'package:university_io/features/presentation/student/bloc/student_bloc.dart';
import 'package:university_io/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:university_io/features/presentation/torch/bloc/torch_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TeacherBloc(getIt<TeacherRepositoryImpl>())..add(TeacherLoad())),
        BlocProvider(create: (_) => StudentBloc(getIt<StudentRepositoryImpl>())..add(StudentLoad())),
        BlocProvider(create: (_) => EventBloc(getIt<EventRepositoryImpl>())..add(EventLoad())),
        BlocProvider(create: (_) => ProjectBloc(getIt<ProjectRepositoryImpl>())..add(ProjectLoad())),
        BlocProvider(create: (_) => DepartmentBloc(getIt<DepartmentRepositoryImpl>())..add(DepartmentLoad())),
        BlocProvider(create: (_) => BookBloc(getIt<BookRepositoryImpl>())..add(BookLoad())),
        BlocProvider(create: (_) => LibraryBloc(getIt<LibraryRepositoryImpl>())..add(LibraryLoad())),
        BlocProvider(create: (_) => MarkBloc(getIt<MarkRepositoryImpl>())..add(MarkLoad())),
        BlocProvider(create: (_) => ClassroomBloc(getIt<ClassroomRepositoryImpl>())..add(ClassroomLoad())),
        BlocProvider(create: (_) => TorchBloc(getIt<TorchesRepositoryImpl>())..add(TorchLoad())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(),
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}
