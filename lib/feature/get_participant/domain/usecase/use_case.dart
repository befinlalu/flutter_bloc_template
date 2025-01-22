import '../../../../core/resource/data_state_response.dart'; // Importing necessary dependencies
import '../../../../core/use_case/use_case.dart'; // Importing the UseCase base class
import '../entity/get_participant_entity.dart'; // Importing the participant entity
import '../repository/get_participant_repository.dart'; // Importing the repository interface

// Implementation of the GetParticipantUseCase, which extends the UseCase class
class GetParticipantUseCase
    implements UseCase<DataStateResponse<List<GetParticipantEntity>>, void> {
  final GetParticipantRepository
      _getParticipantRepository; // Repository dependency
  const GetParticipantUseCase(
      this._getParticipantRepository); // Constructor with repository injection

  @override
  Future<DataStateResponse<List<GetParticipantEntity>>> call({void params}) {
    // Invoking the getParticipant method of the repository to retrieve data
    return _getParticipantRepository.getParticipant();
  }
}
