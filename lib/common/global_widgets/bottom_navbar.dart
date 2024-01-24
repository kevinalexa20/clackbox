import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/features/homescreen/presentation/pages/home_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
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

  final pages = [const HomePage(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        paddingR: const EdgeInsets.only(bottom: 5, top: 5),
        marginR: const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
        currentIndex: _currentIndex,
        onTap: changePage,
        backgroundColor: MediaQuery.of(context)
                .platformBrightness
                .toString()
                .contains("dark")
            ? Color(darkColorScheme.surfaceVariant.value)
            : Color(lightColorScheme.surfaceVariant.value),
        dotIndicatorColor: Colors.transparent,
        items: [
          //HOME
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.onPrimary.value)
                : Color(lightColorScheme.onTertiaryContainer.value),
            unselectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.primary.value)
                : Color(lightColorScheme.primary.value),
          ),
          //SEARCH
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.onPrimary.value)
                : Color(lightColorScheme.onTertiaryContainer.value),
            unselectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.primary.value)
                : Color(lightColorScheme.primary.value),
          ),
          //Notifications
          DotNavigationBarItem(
            icon: const Icon(Icons.notifications),
            selectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.onPrimary.value)
                : Color(lightColorScheme.onTertiaryContainer.value),
            unselectedColor: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.primary.value)
                : Color(lightColorScheme.primary.value),
          ),
        ],
      ),
    );
  }
}
