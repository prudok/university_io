// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:education_portal/config/app_router.dart' as _i3;
import 'package:education_portal/features/data/datasource/database/university_db.dart'
    as _i4;
import 'package:education_portal/features/data/repositories_impl/department_repository_impl.dart'
    as _i5;
import 'package:education_portal/features/data/repositories_impl/event_repository_impl.dart'
    as _i6;
import 'package:education_portal/features/data/repositories_impl/project_repository_impl.dart'
    as _i7;
import 'package:education_portal/features/data/repositories_impl/repositories_impl.dart'
    as _i11;
import 'package:education_portal/features/data/repositories_impl/student_repository_impl.dart'
    as _i8;
import 'package:education_portal/features/data/repositories_impl/teacher_repository_impl.dart'
    as _i9;
import 'package:education_portal/features/presentation/department/bloc/department_bloc.dart'
    as _i10;
import 'package:education_portal/features/presentation/event/bloc/event_bloc.dart'
    as _i12;
import 'package:education_portal/features/presentation/project/bloc/project_bloc.dart'
    as _i13;
import 'package:education_portal/features/presentation/student/bloc/student_bloc.dart'
    as _i14;
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.singleton<_i5.DepartmentRepositoryImpl>(
        _i5.DepartmentRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i6.EventRepositoryImpl>(
        _i6.EventRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i7.ProjectRepositoryImpl>(
        _i7.ProjectRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i8.StudentRepositoryImpl>(
        _i8.StudentRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i9.TeacherRepositoryImpl>(
        _i9.TeacherRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.factory<_i10.DepartmentBloc>(
        () => _i10.DepartmentBloc(gh<_i11.DepartmentRepositoryImpl>()));
    gh.factory<_i12.EventBloc>(
        () => _i12.EventBloc(gh<_i6.EventRepositoryImpl>()));
    gh.factory<_i13.ProjectBloc>(
        () => _i13.ProjectBloc(gh<_i7.ProjectRepositoryImpl>()));
    gh.factory<_i14.StudentBloc>(
        () => _i14.StudentBloc(gh<_i11.StudentRepositoryImpl>()));
    gh.factory<_i15.TeacherBloc>(
        () => _i15.TeacherBloc(gh<_i9.TeacherRepositoryImpl>()));
    return this;
  }
}
