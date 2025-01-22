import 'dart:io'; // Importing necessary dependencies

import 'package:dio/dio.dart'; // Importing the Dio library

import '../../../../core/resource/data_state_response.dart'; // Importing the DataStateResponse class
import '../../domain/repository/get_participant_repository.dart'; // Importing the repository interface
import '../data_source/get_participant_api_service.dart'; // Importing the API service
import '../model/get_participant_model.dart'; // Importing the participant model

// Implementation of the GetParticipantRepository interface
class GetParticipantRepositoryImpli implements GetParticipantRepository {
  final GetParticipantApiService
      _getParticipantApiService; // API service dependency

  GetParticipantRepositoryImpli(
      this._getParticipantApiService); // Constructor injection

  @override
  Future<DataStateResponse<List<GetParticipantModel>>> getParticipant() async {
    try {
      final httpResponse = await _getParticipantApiService.getParticipants();
      print(httpResponse.data);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataStateSuccess(httpResponse.data); // Successful response
      } else {
        return DataStateFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        ); // Failed response
      }
    } on DioException catch (e) {
      return DataStateFailed(e); // Dio exception occurred
    }
  }
}
