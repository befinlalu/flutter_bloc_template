import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing Flutter BLoC library

import '../bloc/bloc/getparticipant_bloc.dart'; // Importing the participant BLoC

class ShowParticipantWidget extends StatelessWidget {
  const ShowParticipantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Showing Participants"),
      ),
      body: _builtBody(), // Building the body of the widget
    );
  }

  _builtBody() {
    return BlocBuilder<GetparticipantBloc, GetparticipantState>(
        builder: (_, state) {
      if (state is ParticipantLoadingState) {
        return const Center(
          child: CircularProgressIndicator(), // Displaying loading indicator
        );
      }
      if (state is ParticipantErrorState) {
        return const Center(
          child: Text('Error loading participants'), // Displaying error message
        );
      }
      if (state is ParticipantDoneState) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Text(state
                    .participants![index].name), // Displaying participant name
              ),
            );
          },
          itemCount: state.participants!.length, // Number of participants
        );
      }
      return const SizedBox(); // Placeholder if none of the above cases
    });
  }
}
