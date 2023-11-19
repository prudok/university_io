import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_io/features/presentation/book/book_view.dart';
import 'package:university_io/features/presentation/department/department_view.dart';
import 'package:university_io/features/presentation/event/event_view.dart';
import 'package:university_io/features/presentation/home/widgets/data_form.dart';
import 'package:university_io/features/presentation/project/project_view.dart';
import 'package:university_io/features/presentation/student/student_view.dart';
import 'package:university_io/features/presentation/teacher/teacher_view.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            content: ConstrainedBox(
              constraints: const BoxConstraints.expand(width: 400, height: 600),
              child: const DataForm(),
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
              _pageController.animateToPage(
                _selectedIndex,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              );
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Students'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.event),
                label: Text('Events'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.table),
                label: Text('Projects'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.holiday_village),
                label: Text('Buildings'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.person_2_alt),
                label: Text('Teachers'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.collections),
                label: Text('Departments'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.book),
                label: Text('Books'),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _selectedIndex = index),
              scrollDirection: Axis.vertical,
              children: const [
                StudentView(),
                EventView(),
                ProjectView(),
                Center(child: Text('Buildings')),
                TeacherView(),
                DepartmentView(),
                BookView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
