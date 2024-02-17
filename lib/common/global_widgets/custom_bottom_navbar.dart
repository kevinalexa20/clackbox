import 'package:clackbox/features/Posts/presentation/pages/create_post_page.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final List<Widget> pages;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            iconSize: 30,
            onPressed: () => widget.onTap(0),
            color: widget.currentIndex == 0
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
          WidthSpacer(width: 20),
          // Add post button
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePostPage()),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                // color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          WidthSpacer(width: 20),
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 30,
            onPressed: () => widget.onTap(2),
            color: widget.currentIndex == 2
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
