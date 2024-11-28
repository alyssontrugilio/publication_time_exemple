import 'package:flutter/material.dart';

class PublicationTimeExample extends StatelessWidget {
  final String publicationDateString;

  const PublicationTimeExample({
    super.key,
    required this.publicationDateString,
  });

  String formatTimeAgo(String dateString) {
    final DateTime publicationDate = DateTime.parse(dateString);
    final Duration diff = DateTime.now().difference(publicationDate);

    if (diff.inSeconds < 60) {
      return 'Publicado agora';
    } else if (diff.inMinutes < 60) {
      return 'Publicado há ${diff.inMinutes} ${diff.inMinutes == 1 ? "minuto" : "minutos"}';
    } else if (diff.inHours < 24) {
      return 'Publicado há ${diff.inHours} ${diff.inHours == 1 ? "hora" : "horas"}';
    } else if (diff.inDays < 30) {
      return 'Publicado há ${diff.inDays} ${diff.inDays == 1 ? "dia" : "dias"}';
    } else {
      final months = (diff.inDays / 30).floor();
      if (months < 12) {
        return 'Publicado há $months ${months == 1 ? "mês" : "meses"}';
      } else {
        final years = (months / 12).floor();
        return 'Publicado há $years ${years == 1 ? "ano" : "anos"}';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTimeAgo(publicationDateString),
      style: const TextStyle(fontSize: 16),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Tempo de Publicação')),
      body: const Center(
        child: PublicationTimeExample(
          publicationDateString: "2022-11-27 01:03:55",
        ),
      ),
    ),
  ));
}
