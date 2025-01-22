import 'package:json_annotation/json_annotation.dart'; // Importing necessary dependencies

import '../../domain/entity/get_participant_entity.dart'; // Importing the participant entity
part 'get_participant_model.g.dart'; // Auto-generated part file for JSON serialization

@JsonSerializable() // Marking the class for JSON serialization
class GetParticipantModel extends GetParticipantEntity {
  const GetParticipantModel(
    int participantId,
    String name,
  ) : super(
          participantId: participantId,
          name: name,
        );

  // Factory method to create a GetParticipantModel instance from JSON data
  factory GetParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$GetParticipantModelFromJson(json);

  // Method to convert the GetParticipantModel instance to a JSON map
  Map<String, dynamic> toJson() => _$GetParticipantModelToJson(this);
}
