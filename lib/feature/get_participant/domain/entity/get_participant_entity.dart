import 'package:equatable/equatable.dart';

class GetParticipantEntity extends Equatable {
  final int participantId; // The ID of the participant
  final String name; // The name of the participant

  const GetParticipantEntity({
    required this.participantId, // Constructor parameter for participant ID
    required this.name, // Constructor parameter for participant name
  });

  @override
  List<Object?> get props => [
        participantId, // Include participant ID in props for equality comparison
        name, // Include name in props for equality comparison
      ];
}
