import 'package:dio/dio.dart';
import 'package:education_portal/common/foundations/constant_foundation.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:retrofit/retrofit.dart';

part 'university_api.g.dart';

@RestApi(baseUrl: ConstantFoundation.baseAPIUrl)
abstract class UniversityAPI {
  factory UniversityAPI(Dio dio, {String baseUrl}) = _UniversityAPI;

  @GET(ConstantFoundation.baseAPIUrl)
  Future<List<Student>> loadStudents();
}
