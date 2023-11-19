// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:university_io/config/app_router.dart' as _i3;
import 'package:university_io/features/data/datasource/database/university_db.dart'
    as _i4;
import 'package:university_io/features/data/repositories_impl/accuracy_tables_repository_impl.dart'
    as _i7;
import 'package:university_io/features/data/repositories_impl/alliances_repository_impl.dart'
    as _i8;
import 'package:university_io/features/data/repositories_impl/books_repository_impl.dart'
    as _i9;
import 'package:university_io/features/data/repositories_impl/classrooms_repository_impl.dart'
    as _i10;
import 'package:university_io/features/data/repositories_impl/department_repository_impl.dart'
    as _i11;
import 'package:university_io/features/data/repositories_impl/department_teacher_link_repository_impl.dart'
    as _i12;
import 'package:university_io/features/data/repositories_impl/events_repository_impl.dart'
    as _i13;
import 'package:university_io/features/data/repositories_impl/groups_repository_impl.dart'
    as _i15;
import 'package:university_io/features/data/repositories_impl/gto_repository_impl.dart'
    as _i14;
import 'package:university_io/features/data/repositories_impl/libraries_repository_impl.dart'
    as _i16;
import 'package:university_io/features/data/repositories_impl/marks_repository_impl.dart'
    as _i17;
import 'package:university_io/features/data/repositories_impl/news_repository_impl.dart'
    as _i18;
import 'package:university_io/features/data/repositories_impl/projects_repository_impl.dart'
    as _i19;
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart'
    as _i30;
import 'package:university_io/features/data/repositories_impl/schedules_repository_impl.dart'
    as _i20;
import 'package:university_io/features/data/repositories_impl/sport_activities_repository_impl.dart'
    as _i21;
import 'package:university_io/features/data/repositories_impl/sport_teams_repository_impl.dart'
    as _i22;
import 'package:university_io/features/data/repositories_impl/students_repository_impl.dart'
    as _i23;
import 'package:university_io/features/data/repositories_impl/subjects_repository_impl.dart'
    as _i24;
import 'package:university_io/features/data/repositories_impl/syllabus_repository_impl.dart'
    as _i25;
import 'package:university_io/features/data/repositories_impl/teachers_repository_impl.dart'
    as _i26;
import 'package:university_io/features/data/repositories_impl/torches_repository_impl.dart'
    as _i27;
import 'package:university_io/features/data/repositories_impl/types_of_activities_repository_impl.dart'
    as _i28;
import 'package:university_io/features/data/repositories_impl/university_dormitories_repository_impl.dart'
    as _i5;
import 'package:university_io/features/data/repositories_impl/volunteering_repository_impl.dart'
    as _i6;
import 'package:university_io/features/presentation/book/bloc/book_bloc.dart'
    as _i29;
import 'package:university_io/features/presentation/department/bloc/department_bloc.dart'
    as _i31;
import 'package:university_io/features/presentation/event/bloc/event_bloc.dart'
    as _i32;
import 'package:university_io/features/presentation/project/bloc/project_bloc.dart'
    as _i33;
import 'package:university_io/features/presentation/student/bloc/student_bloc.dart'
    as _i34;
import 'package:university_io/features/presentation/teacher/bloc/teacher_bloc.dart'
    as _i35;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.singleton<_i4.UniversityDatabase>(_i4.UniversityDatabase());
    gh.singleton<_i5.UniversityDormitoryRepositoryImpl>(
        _i5.UniversityDormitoryRepositoryImpl(
            db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i6.VolunteeringRepositoryImpl>(
        _i6.VolunteeringRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i7.AccuracyTableRepositoryImpl>(
        _i7.AccuracyTableRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i8.AllianceRepositoryImpl>(
        _i8.AllianceRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i9.BookRepositoryImpl>(
        _i9.BookRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i10.ClassroomRepositoryImpl>(
        _i10.ClassroomRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i11.DepartmentRepositoryImpl>(
        _i11.DepartmentRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i12.DepartmentTeacherLinkRepositoryImpl>(
        _i12.DepartmentTeacherLinkRepositoryImpl(
            db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i13.EventRepositoryImpl>(
        _i13.EventRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i14.GTORepositoryImpl>(
        _i14.GTORepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i15.GroupRepositoryImpl>(
        _i15.GroupRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i16.LibraryRepositoryImpl>(
        _i16.LibraryRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i17.MarkRepositoryImpl>(
        _i17.MarkRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i18.NewsRepositoryImpl>(
        _i18.NewsRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i19.ProjectRepositoryImpl>(
        _i19.ProjectRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i20.ScheduleRepositoryImpl>(
        _i20.ScheduleRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i21.SportActivitiesRepositoryImpl>(
        _i21.SportActivitiesRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i22.SportTeamRepositoryImpl>(
        _i22.SportTeamRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i23.StudentRepositoryImpl>(
        _i23.StudentRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i24.SubjectRepositoryImpl>(
        _i24.SubjectRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i25.SyllabusRepositoryImpl>(
        _i25.SyllabusRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i26.TeacherRepositoryImpl>(
        _i26.TeacherRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i27.TorchesRepositoryImpl>(
        _i27.TorchesRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i28.TypeOfActivitiesRepositoryImpl>(
        _i28.TypeOfActivitiesRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.factory<_i29.BookBloc>(
        () => _i29.BookBloc(gh<_i30.BookRepositoryImpl>()));
    gh.factory<_i31.DepartmentBloc>(
        () => _i31.DepartmentBloc(gh<_i30.DepartmentRepositoryImpl>()));
    gh.factory<_i32.EventBloc>(
        () => _i32.EventBloc(gh<_i30.EventRepositoryImpl>()));
    gh.factory<_i33.ProjectBloc>(
        () => _i33.ProjectBloc(gh<_i30.ProjectRepositoryImpl>()));
    gh.factory<_i34.StudentBloc>(
        () => _i34.StudentBloc(gh<_i30.StudentRepositoryImpl>()));
    gh.factory<_i35.TeacherBloc>(
        () => _i35.TeacherBloc(gh<_i30.TeacherRepositoryImpl>()));
    return this;
  }
}
