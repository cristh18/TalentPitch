import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/pitch_response_dto.dart';

part 'talent_pitch_api.g.dart';

@RestApi(baseUrl: 'https://data2.talentpitch.co')
abstract class TalentPitchApi {

  factory TalentPitchApi(Dio dio, {String baseUrl}) = _TalentPitchApi;

  @GET('/api/homeservice/categories/all/12')
  Future<List<PitchResponseDto>> getTalentPitches();
}
