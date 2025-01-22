import 'package:dio/dio.dart'; // Importing necessary dependencies
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/get_participant_model.dart'; // Importing the participant model
part 'get_participant_api_service.g.dart'; // Auto-generated part file for Retrofit

@RestApi(
    baseUrl: "https://endpoint.api.cohubitate.com/api/") // Base URL for API
abstract class GetParticipantApiService {
  // Factory constructor for creating an instance of GetParticipantApiService
  factory GetParticipantApiService(Dio dio) = _GetParticipantApiService;

  @GET('participants/') // HTTP GET request for retrieving participants
  Future<HttpResponse<List<GetParticipantModel>>> getParticipants();
}
