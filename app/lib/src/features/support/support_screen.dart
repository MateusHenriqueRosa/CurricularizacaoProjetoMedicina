import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/section_title.dart';

class _Contact {
  final String name;
  final String description;
  final String phone;
  final IconData icon;
  final Color color;

  const _Contact({
    required this.name,
    required this.description,
    required this.phone,
    required this.icon,
    required this.color,
  });
}

const _contacts = [
  _Contact(
    name: 'Ligue 180',
    description: 'Central de Atendimento à Mulher\nApoio a vítimas de violência (24h)',
    phone: '180',
    icon: Icons.phone_in_talk,
    color: Color(0xFFC43A4A),
  ),
  _Contact(
    name: 'Disque Saúde',
    description: 'Informações e orientações de saúde\nMinistério da Saúde (24h)',
    phone: '136',
    icon: Icons.local_hospital,
    color: Color(0xFF2E7D32),
  ),
  _Contact(
    name: 'SAMU',
    description: 'Serviço de Atendimento Móvel de Urgência\nEmergências médicas',
    phone: '192',
    icon: Icons.emergency,
    color: Color(0xFFD32F2F),
  ),
  _Contact(
    name: 'CVV - Centro de Valorização da Vida',
    description: 'Apoio emocional e prevenção ao suicídio\nAtendimento gratuito (24h)',
    phone: '188',
    icon: Icons.favorite,
    color: Color(0xFFC56682),
  ),
  _Contact(
    name: 'Polícia Militar',
    description: 'Emergências e situações de perigo',
    phone: '190',
    icon: Icons.local_police,
    color: Color(0xFF1565C0),
  ),
  _Contact(
    name: 'Defesa Civil',
    description: 'Desastres naturais e emergências coletivas',
    phone: '199',
    icon: Icons.warning_amber,
    color: Color(0xFFE65100),
  ),
];

class _Info {
  final String title;
  final String content;
  final IconData icon;

  const _Info({
    required this.title,
    required this.content,
    required this.icon,
  });
}

const _infos = [
  _Info(
    title: 'O que é a UBS?',
    content:
        'A Unidade Básica de Saúde (UBS) é a porta de entrada do SUS. '
        'Oferece consultas médicas, exames preventivos, vacinas, '
        'planejamento familiar e acompanhamento de saúde da mulher. '
        'Procure a UBS mais próxima de você.',
    icon: Icons.medical_information_outlined,
  ),
  _Info(
    title: 'CRAM e DEAM',
    content:
        'O Centro de Referência de Atendimento à Mulher (CRAM) e a '
        'Delegacia Especializada em Atendimento à Mulher (DEAM) '
        'são serviços especializados para mulheres em situação de violência. '
        'Oferecem atendimento psicológico, jurídico e social.',
    icon: Icons.gavel_outlined,
  ),
  _Info(
    title: 'Casa-Abrigo',
    content:
        'As Casas-Abrigo são locais seguros para mulheres e seus filhos '
        'que correm risco de vida. O acesso é feito por meio de '
        'encaminhamento da DEAM, CRAM ou outras redes de proteção.',
    icon: Icons.house_outlined,
  ),
];

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rede de Apoio')),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFC43A4A), Color(0xFFC56682)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Você não está sozinha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Se precisar de ajuda, entre em contato com os serviços abaixo. '
                  'Todos são gratuitos e confidenciais.',
                  style: TextStyle(color: Colors.white70, height: 1.4),
                ),
              ],
            ),
          ),
          const SectionTitle('Contatos de emergência'),
          ..._contacts.map((c) => _ContactCard(contact: c)),
          const SectionTitle('Serviços e informações'),
          ..._infos.map((info) => _InfoCard(info: info)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact});
  final _Contact contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: contact.color.withValues(alpha: 0.12),
          child: Icon(contact.icon, color: contact.color),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.description),
        isThreeLine: true,
        trailing: FilledButton.tonal(
          style: FilledButton.styleFrom(
            backgroundColor: contact.color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            minimumSize: Size.zero,
          ),
          onPressed: () => _dial(context, contact.phone),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.call, size: 18),
              Text(contact.phone,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dial(BuildContext context, String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ligue para $phone')),
        );
      }
    }
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.info});
  final _Info info;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: ExpansionTile(
        leading: Icon(info.icon, color: cs.primary),
        title: Text(
          info.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              info.content,
              style: const TextStyle(height: 1.6, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
