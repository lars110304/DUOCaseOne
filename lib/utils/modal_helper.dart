import 'package:flutter/material.dart';
import '../widgets/filter_modal.dart';

class RightSlideModalRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  RightSlideModalRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Start from the right
            const end = Offset.zero; // End at the original position
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}

class ModalHelper {
  static void showFilterModal(BuildContext context) {
    Navigator.of(context).push(RightSlideModalRoute(
      page: Scaffold(
        backgroundColor: Colors.transparent,
        body: FilterModal(), // The filter modal widget to show
      ),
    ));
  }
}
