import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class KakaoChatInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSend;

  const KakaoChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppTheme.divider),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              color: Colors.grey[700],
              onPressed: () {}, // TODO: 이미지·이모티콘 보내기
            ),
            Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: '메시지 입력',
                  isDense: true,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              color: Colors.grey[700],
              onPressed: () => onSend(controller.text),
            ),
          ],
        ),
      ),
    );
  }
}
