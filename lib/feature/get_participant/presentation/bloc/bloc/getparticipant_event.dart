part of 'getparticipant_bloc.dart'; // Connecting to the main BLoC file

// Abstract base class for participant events
abstract class GetparticipantEvent {
  const GetparticipantEvent();
}

// Concrete event class for representing the "ParticipantEvent"
class ParticipantEvent extends GetparticipantEvent {
  const ParticipantEvent(); // Constructor for creating a ParticipantEvent
}
