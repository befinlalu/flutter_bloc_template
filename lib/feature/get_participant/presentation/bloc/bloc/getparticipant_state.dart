part of 'getparticipant_bloc.dart'; // Connecting to the main BLoC file

// Sealed class for representing different states related to participant retrieval
sealed class GetparticipantState extends Equatable {
  final List<GetParticipantEntity>?
      participants; // List of participant entities
  final DioException? dioException; // DioException if an error occurs
  const GetparticipantState({
    this.participants,
    this.dioException,
  });

  @override
  List<Object> get props => [
        participants!,
        dioException!,
      ];
}

// State representing the loading state while fetching participants
class ParticipantLoadingState extends GetparticipantState {
  const ParticipantLoadingState();
}

// State representing the successful retrieval of participants
class ParticipantDoneState extends GetparticipantState {
  const ParticipantDoneState(List<GetParticipantEntity> participants)
      : super(participants: participants);
}

// State representing an error occurred while fetching participants
class ParticipantErrorState extends GetparticipantState {
  const ParticipantErrorState(DioException dioException)
      : super(dioException: dioException);
}
