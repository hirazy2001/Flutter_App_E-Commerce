import 'package:flutter/material.dart';

class CommonPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  // CommonPageRoute({required RoutePageBuilder pageBuilder}) : super(pageBuilder: pageBuilder);

  CommonPageRoute(
      {required this.child,
      this.direction = AxisDirection.right,
      RouteSettings? settings})
      : super(
            reverseTransitionDuration: const Duration(seconds: 1),
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: getBeginOffset(), end: Offset.zero)
            .animate(animation),
        child: child,
      );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.left:
        return const Offset(1, 0);
      case AxisDirection.right:
        return const Offset(-1, 0);
    }
  }
}
