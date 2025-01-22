import 'dart:async'; // Importing necessary dependencies

import 'package:dio/dio.dart'; // Importing the Dio library
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing the Flutter BLoC library
import 'package:equatable/equatable.dart'; // Importing the Equatable library

import '../../../../../core/resource/data_state_response.dart'; // Importing the DataStateResponse class
import '../../../domain/entity/get_participant_entity.dart'; // Importing the participant entity
import '../../../domain/usecase/use_case.dart'; // Importing the use case

part 'getparticipant_event.dart'; // Importing the event part file
part 'getparticipant_state.dart'; // Importing the state part file

// BLoC class for managing the participant-related states and events
class GetparticipantBloc
    extends Bloc<GetparticipantEvent, GetparticipantState> {
  final GetParticipantUseCase _getParticipantUseCase; // Use case dependency

  GetparticipantBloc(this._getParticipantUseCase)
      : super(ParticipantLoadingState()) {
    on<ParticipantEvent>(participantEvent); // Handling participant events
  }

  FutureOr<void> participantEvent(
      ParticipantEvent event, Emitter<GetparticipantState> emit) async {
    final dataState = await _getParticipantUseCase(); // Execute the use case
    if (dataState is DataStateSuccess && dataState.data!.isNotEmpty) {
      emit(ParticipantDoneState(
          dataState.data!)); // Emit success state with data
    }
    if (dataState is DataStateFailed) {
      emit(ParticipantErrorState(dataState.dioException!)); // Emit error state
    }
  }
}
