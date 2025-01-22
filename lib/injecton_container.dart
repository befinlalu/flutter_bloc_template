import 'package:dio/dio.dart'; // Importing the Dio library
import 'package:get_it/get_it.dart'; // Importing the GetIt package

import 'feature/get_participant/data/data_source/get_participant_api_service.dart'; // Importing the API service
import 'feature/get_participant/data/repository/get_participant_repository_implimentation.dart'; // Importing the repository implementation
import 'feature/get_participant/domain/repository/get_participant_repository.dart'; // Importing the repository interface
import 'feature/get_participant/domain/usecase/use_case.dart'; // Importing the use case
import 'feature/get_participant/presentation/bloc/bloc/getparticipant_bloc.dart'; // Importing the BLoC

final sl = GetIt.instance; // Creating a singleton instance of GetIt

Future<void> initializeDependencies() async {
  // Registering Dio as a singleton
  sl.registerSingleton<Dio>(Dio());

  // Registering dependencies
  sl.registerSingleton<GetParticipantApiService>(
      GetParticipantApiService(sl())); // Registering the API service

  // Registering repository
  sl.registerSingleton<GetParticipantRepository>(GetParticipantRepositoryImpli(
      sl())); // Registering the repository implementation

  // Registering use cases
  sl.registerSingleton<GetParticipantUseCase>(
      GetParticipantUseCase(sl())); // Registering the use case

  // Registering BLoCs
  sl.registerFactory<GetparticipantBloc>(
      () => GetparticipantBloc(sl())); // Registering the BLoC factory
}
