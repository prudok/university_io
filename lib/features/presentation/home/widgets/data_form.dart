import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/features/presentation/book/widgets/book_form.dart';
import 'package:university_io/features/presentation/classroom/widgets/classroom_form.dart';
import 'package:university_io/features/presentation/department/widgets/deparment_form.dart';
import 'package:university_io/features/presentation/event/widgets/event_form.dart';
import 'package:university_io/features/presentation/library/widgets/library_form.dart';
import 'package:university_io/features/presentation/mark/widgets/mark_form.dart';
import 'package:university_io/features/presentation/project/widgets/project_form.dart';
import 'package:university_io/features/presentation/student/widgets/student_form.dart';
import 'package:university_io/features/presentation/teacher/widgets/teacher_form.dart';
import 'package:university_io/features/presentation/torch/widgets/torch_form.dart';

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
    _tabController = TabController(length: 10, vsync: this);
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
            Tab(icon: Icon(Icons.man)),
            Tab(icon: Icon(Icons.event)),
            Tab(icon: Icon(CupertinoIcons.table)),
            Tab(icon: Icon(Icons.sticky_note_2)),
            Tab(icon: Icon(Icons.book)),
            Tab(icon: Icon(CupertinoIcons.book_solid)),
            Tab(icon: Icon(Icons.grade)),
            Tab(icon: Icon(Icons.home_mini)),
            Tab(icon: Icon(Icons.tornado)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              StudentForm(),
              TeacherForm(),
              EventForm(),
              ProjectForm(),
              DepartmentForm(),
              BookForm(),
              LibraryForm(),
              MarkForm(),
              ClassroomForm(),
              TorchForm(),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(shadowColor: Colors.transparent),
          child: const Text('Close'),
        ),
        SpacingFoundation.verticalSpaceSmall,
      ],
    );
  }
}
