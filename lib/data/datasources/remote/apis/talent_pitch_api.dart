import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/pitch_data_response_dto.dart';

part 'talent_pitch_api.g.dart';

@RestApi()
abstract class TalentPitchApi {
  factory TalentPitchApi(Dio dio) = _TalentPitchApi;

  @GET('/api/homeservice/categories/all/12')
  Future<PitchDataResponseDto> getTalentPitches();
}
