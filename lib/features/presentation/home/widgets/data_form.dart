import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/features/presentation/event/widgets/event_form.dart';
import 'package:education_portal/features/presentation/student/widgets/student_form.dart';
import 'package:education_portal/features/presentation/teacher/widgets/teacher_form.dart';
import 'package:flutter/material.dart';

class DataForm extends StatefulWidget {
  const DataForm({super.key});

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.people)),
            Tab(icon: Icon(Icons.event)),
            Tab(icon: Icon(Icons.library_add)),
            Tab(icon: Icon(Icons.library_add)),
            Tab(icon: Icon(Icons.man)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              StudentForm(),
              EventForm(),
              Center(child: Text('some text')),
              Center(child: Text('some text')),
              TeacherForm(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpaceSmall,
      ],
    );
  }
}
