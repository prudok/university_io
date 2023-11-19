import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/presentation/book/book_view.dart';
import 'package:university_io/features/presentation/department/department_view.dart';
import 'package:university_io/features/presentation/event/event_view.dart';
import 'package:university_io/features/presentation/home/home.dart';
import 'package:university_io/features/presentation/project/project_view.dart';
import 'package:university_io/features/presentation/student/student_view.dart';
import 'package:university_io/features/presentation/teacher/teacher_view.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'View|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(page: TeacherRoute.page),
          ],
        ),
      ];
}
