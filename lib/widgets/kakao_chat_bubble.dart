import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class KakaoChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  const KakaoChatBubble({super.key, required this.text, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? AppTheme.bubbleMe : AppTheme.bubbleOther;
    final align = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bg, borderRadius: radius),
        child: Text(text,
            style: const TextStyle(fontSize: 15, color: Colors.black87)),
      ),
    );
  }
}
