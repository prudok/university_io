import 'package:auto_route/auto_route.dart';
import 'package:education_portal/features/presentation/home/widgets/data_form.dart';
import 'package:education_portal/features/presentation/teacher/teacher_form.dart';
import 'package:education_portal/features/presentation/teacher/teacher_view.dart';
import 'package:flutter/material.dart';

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
              constraints: const BoxConstraints.expand(width: 300),
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
                icon: Icon(Icons.book),
                label: Text('Library'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.play_lesson),
                label: Text('Lessons'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.holiday_village),
                label: Text('Buildings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.emoji_people),
                label: Text('Teachers'),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _selectedIndex = index),
              scrollDirection: Axis.vertical,
              children: const [
                TeacherForm(),
                // TeacherView(),
                TeacherView(),
                TeacherView(),
                TeacherView(),
                TeacherView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
