import 'package:auto_route/auto_route.dart';
import 'package:education_portal/features/presentation/event/event_view.dart';
import 'package:education_portal/features/presentation/home/home.dart';
import 'package:education_portal/features/presentation/student/student_view.dart';
import 'package:education_portal/features/presentation/teacher/teacher_view.dart';
import 'package:injectable/injectable.dart';

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
