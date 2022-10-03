import 'package:flutter/material.dart';

class SlideShowWidget extends StatefulWidget {
  final Widget child;

  const SlideShowWidget({Key? key, required this.child}) : super(key: key);

  @override
  _SlideShowWidgetState createState() => _SlideShowWidgetState();
}

class _SlideShowWidgetState extends State<SlideShowWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _offsetFloat =
        Tween(begin: const Offset(0.0, -0.03), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastOutSlowIn,
          ),
        );

    _offsetFloat.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetFloat,
      child: widget.child,
    );
  }
}
