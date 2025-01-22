import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing the Flutter BLoC package
import 'package:flutter_bloc_template/feature/get_participant/presentation/bloc/bloc/getparticipant_bloc.dart'; // Importing the participant BLoC
import 'package:flutter_bloc_template/feature/get_participant/presentation/widget/participant_widget.dart'; // Importing the participant widget

import 'injecton_container.dart'; // Importing your dependency injection setup

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initializing Flutter bindings
  await initializeDependencies(); // Initializing your dependencies
  runApp(const MainApp()); // Running the main app widget
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetparticipantBloc>(
      create: (context) => sl()
        ..add(const ParticipantEvent()), // Creating and initializing the BLoC
      child: const MaterialApp(
        home: ShowParticipantWidget(), // Setting the main widget
      ),
    );
  }
}
