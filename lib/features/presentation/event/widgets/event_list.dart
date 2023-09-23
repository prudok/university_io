import 'package:education_portal/features/data/datasource/databases/university_db.dart';
import 'package:education_portal/features/presentation/event/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  const EventList({required this.events, super.key});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventBloc>(context);

    return SliverList.separated(
      itemCount: events.length,
      itemBuilder: (_, index) {
        final event = events[index];

        return ListTile(
          leading: const Icon(Icons.event, size: 35),
          title: Text(event.title),
          subtitle: Row(
            children: [
              Text(event.description),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => eventBloc.add(EventRemove(id: event.id)),
                icon: const Icon(Icons.remove, size: 15),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
