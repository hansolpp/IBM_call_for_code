import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});
  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
with SingleTickerProviderStateMixin{
  Alignment _dragAlignment = Alignment.center;
  AnimationController _controller;
  Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size){
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);

//    _controller.reset();
//    _controller.forward();
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState((){
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details){
        _controller.stop();
      },

      onPanUpdate: (details){
        setState((){
//          _dragAlignment = Alignment(details.delta.dx, details.delta.dy);
          _dragAlignment += Alignment(
//            details.delta.dx,
//            details.delta.dy
            details.delta.dx / (size.width /2),
            details.delta.dy / (size.height /2),
          );
        });
      },
      onPanEnd: (details){
        _runAnimation(details.velocity.pixelsPerSecond, size);
//        _runAnimation();
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
    return Align(
      child: Card(
        child: widget.child,
      ),
    );
  }
}