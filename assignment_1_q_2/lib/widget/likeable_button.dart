// likable_button.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeableButton extends StatefulWidget {
  final Color color;
  const LikeableButton({
    super.key,
    this.color = Colors.white54,
  });

  @override
  State<LikeableButton> createState() => _LikeableButtonState();
}

class _LikeableButtonState extends State<LikeableButton> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() => liked = !liked),
      icon: Icon(
        liked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        color: widget.color,
      ),
    );
  }
}
