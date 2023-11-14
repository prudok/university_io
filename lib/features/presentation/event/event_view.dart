import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/event/bloc/event_bloc.dart';
import 'package:university_io/features/presentation/event/widgets/event_list.dart';

@RoutePage()
class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EventBloc, EventState>(
        builder: (_, state) {
          return switch (state) {
            final EventInitial _ => const Center(child: CircularProgressIndicator()),
            final EventLoading _ => const Center(child: CircularProgressIndicator()),
            final EventFailed error => Center(child: Text(error.errorMessage)),
            final EventLoaded state => state.events.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      EventList(events: state.events),
                    ],
                  )
                : const Center(child: Text('No Events Found.')),
          };
        },
      ),
    );
  }
}
