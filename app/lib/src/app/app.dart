import 'package:flutter/material.dart';
import 'theme.dart';
import '../features/home/home_screen.dart';
import '../features/cycle/cycle_screen.dart';
import '../features/education/education_screen.dart';
import '../features/reminders/reminders_screen.dart';
import '../features/support/support_screen.dart';

class MinhaeSaudeFemininaApp extends StatelessWidget {
  const MinhaeSaudeFemininaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Saúde Feminina',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CycleScreen(),
    EducationScreen(),
    RemindersScreen(),
    SupportScreen(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Início',
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month),
      label: 'Ciclo',
    ),
    NavigationDestination(
      icon: Icon(Icons.menu_book_outlined),
      selectedIcon: Icon(Icons.menu_book),
      label: 'Educação',
    ),
    NavigationDestination(
      icon: Icon(Icons.alarm_outlined),
      selectedIcon: Icon(Icons.alarm),
      label: 'Lembretes',
    ),
    NavigationDestination(
      icon: Icon(Icons.favorite_outline),
      selectedIcon: Icon(Icons.favorite),
      label: 'Apoio',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) =>
            setState(() => _currentIndex = index),
        destinations: _destinations,
      ),
    );
  }
}
