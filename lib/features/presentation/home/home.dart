import 'package:auto_route/auto_route.dart';
import 'package:education_portal/common/themes/uni_theme.dart';
import 'package:education_portal/features/presentation/teacher/teacher.dart';
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

  void _updateTheme() {
    if (Theme.of(context).brightness == Brightness.light) {
      UniTheme.of(context)?.updateTheme(ThemeData.dark(useMaterial3: true));
    } else {
      UniTheme.of(context)?.updateTheme(ThemeData.light(useMaterial3: true));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _updateTheme,
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (context) {
            return Dialog(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      'Add New Teacher',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
                duration: const Duration(milliseconds: 500),
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
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _selectedIndex = index),
              scrollDirection: Axis.vertical,
              children: const [
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
