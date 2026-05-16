import 'package:flutter/material.dart';
import '../../components/safety_banner.dart';
import 'education_screen.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(article.category)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: cs.primaryContainer,
                  child: Icon(article.icon, color: cs.primary, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: cs.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SafetyBanner(),
            const SizedBox(height: 16),
            ..._parseContent(article.content, context),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar aos conteúdos'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _parseContent(String content, BuildContext context) {
    final lines = content.split('\n');
    return lines.map((line) {
      if (line.startsWith('**') && line.endsWith('**')) {
        return Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Text(
            line.replaceAll('**', ''),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      }
      if (line.startsWith('• ')) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 15)),
              Expanded(
                child: Text(
                  _parseBold(line.substring(2)),
                  style: const TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ],
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          line,
          style: const TextStyle(fontSize: 15, height: 1.6),
        ),
      );
    }).toList();
  }

  String _parseBold(String text) {
    return text.replaceAll('**', '');
  }
}
