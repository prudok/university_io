// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:education_portal/config/app_router.dart' as _i3;
import 'package:education_portal/features/data/datasource/databases/databases.dart'
    as _i6;
import 'package:education_portal/features/data/datasource/databases/people_db.dart'
    as _i4;
import 'package:education_portal/features/data/teacher_repository/teacher_repository_impl.dart'
    as _i5;
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart'
    as _i7;
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
    gh.singleton<_i4.PeopleDatabase>(_i4.PeopleDatabase());
    gh.singleton<_i5.TeacherRepositoryImpl>(
        _i5.TeacherRepositoryImpl(db: gh<_i6.PeopleDatabase>()));
    gh.factory<_i7.TeacherBloc>(
        () => _i7.TeacherBloc(gh<_i5.TeacherRepositoryImpl>()));
    return this;
  }
}
