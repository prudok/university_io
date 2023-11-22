// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookView(),
      );
    },
    DepartmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DepartmentView(),
      );
    },
    EventRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EventView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LibraryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LibraryView(),
      );
    },
    ProjectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectView(),
      );
    },
    StudentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentView(),
      );
    },
    TeacherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeacherView(),
      );
    },
  };
}

/// generated route for
/// [BookView]
class BookRoute extends PageRouteInfo<void> {
  const BookRoute({List<PageRouteInfo>? children})
      : super(
          BookRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DepartmentView]
class DepartmentRoute extends PageRouteInfo<void> {
  const DepartmentRoute({List<PageRouteInfo>? children})
      : super(
          DepartmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'DepartmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EventView]
class EventRoute extends PageRouteInfo<void> {
  const EventRoute({List<PageRouteInfo>? children})
      : super(
          EventRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryView]
class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectView]
class ProjectRoute extends PageRouteInfo<void> {
  const ProjectRoute({List<PageRouteInfo>? children})
      : super(
          ProjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentView]
class StudentRoute extends PageRouteInfo<void> {
  const StudentRoute({List<PageRouteInfo>? children})
      : super(
          StudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherView]
class TeacherRoute extends PageRouteInfo<void> {
  const TeacherRoute({List<PageRouteInfo>? children})
      : super(
          TeacherRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeacherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
