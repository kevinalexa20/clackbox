import 'package:auto_route/auto_route.dart';
import 'package:clackbox/global_widgets/custom_bottom_navbar.dart';
import 'package:clackbox/features/Home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

int _currentIndex = 0;

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [HomePage(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        pages: pages,
        onTap: changePage,
      ),
    );
  }
}
