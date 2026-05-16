import 'package:flutter/material.dart';

class SafetyBanner extends StatelessWidget {
  const SafetyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3CD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFCA2C)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFF856404), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Essas informações não substituem avaliação médica. '
              'Procure sempre a UBS para confirmação e acompanhamento.',
              style: TextStyle(
                fontSize: 12,
                color: const Color(0xFF856404),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
