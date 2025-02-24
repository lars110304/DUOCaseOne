import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<CustomBottomNavBarItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final isSelected = items.indexOf(item) == currentIndex;
          final isAddPost = items.indexOf(item) == 2; // Check if this is the Add Post item

          return GestureDetector(
            onTap: () => onTap(items.indexOf(item)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isAddPost)
                  Container(
                    width: 50, // Adjust the size of the circle
                    height: 50, // Adjust the size of the circle
                    decoration: BoxDecoration(
                      color: const Color(0xff2F9675), // Background color of the circle
                      shape: BoxShape.circle,
                    ),
                    child: IconTheme(
                      data: const IconThemeData(
                        color: Colors.white, // Icon color inside the circle
                      ),
                      child: item.icon,
                    ),
                  )
                else
                  SizedBox(
                    width: 45, // Adjust the width as needed
                    height: 30, // Adjust the height as needed
                    child: IconTheme(
                      data: IconThemeData(
                        color: isSelected ? const Color(0xff2F9675) : Colors.black, // Change icon color if selected
                      ),
                      child: item.icon,
                    ),
                  ),
                if (item.label != null) const SizedBox(height: 4),
                if (item.label != null)
                  Text(
                    item.label!,
                    style: TextStyle(
                      color: isSelected ? const Color(0xff2F9675) : Colors.black, // Change label color if selected
                      fontSize: 12, // Adjust font size as needed
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavBarItem {
  final Widget icon;
  final String? label;

  CustomBottomNavBarItem({
    required this.icon,
    this.label,
  });
}