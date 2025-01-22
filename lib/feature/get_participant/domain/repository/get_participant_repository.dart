import '../../../../core/resource/data_state_response.dart'; // Importing necessary dependencies
import '../entity/get_participant_entity.dart'; // Importing the participant entity

// Abstract class defining the contract for a GetParticipantRepository
abstract class GetParticipantRepository {
  // A method to retrieve a list of GetParticipantEntity wrapped in a DataStateResponse
  Future<DataStateResponse<List<GetParticipantEntity>>> getParticipant();
  // The method should be implemented by concrete repository classes.
}
