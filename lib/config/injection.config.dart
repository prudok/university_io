// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:education_portal/config/app_router.dart' as _i3;
import 'package:education_portal/features/data/datasource/databases/university_db.dart'
    as _i4;
import 'package:education_portal/features/data/repositories_impl/event_repository_impl.dart'
    as _i5;
import 'package:education_portal/features/data/repositories_impl/repositories_impl.dart'
    as _i10;
import 'package:education_portal/features/data/repositories_impl/student_repository_impl.dart'
    as _i6;
import 'package:education_portal/features/data/repositories_impl/teacher_repository_impl.dart'
    as _i7;
import 'package:education_portal/features/presentation/event/bloc/event_bloc.dart'
    as _i8;
import 'package:education_portal/features/presentation/student/bloc/student_bloc.dart'
    as _i9;
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart'
    as _i11;
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
    gh.singleton<_i5.EventRepositoryImpl>(
        _i5.EventRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i6.StudentRepositoryImpl>(
        _i6.StudentRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.singleton<_i7.TeacherRepositoryImpl>(
        _i7.TeacherRepositoryImpl(db: gh<_i4.UniversityDatabase>()));
    gh.factory<_i8.EventBloc>(
        () => _i8.EventBloc(gh<_i5.EventRepositoryImpl>()));
    gh.factory<_i9.StudentBloc>(
        () => _i9.StudentBloc(gh<_i10.StudentRepositoryImpl>()));
    gh.factory<_i11.TeacherBloc>(
        () => _i11.TeacherBloc(gh<_i7.TeacherRepositoryImpl>()));
    return this;
  }
}
