import 'package:flutter/material.dart';
import '../../components/safety_banner.dart';
import '../../components/section_title.dart';
import '../profile/profile_screen.dart';

enum LifePhase {
  adolescente,
  adulta,
  gestante,
  tentante,
  climaterio,
  senescencia,
}

extension LifePhaseLabel on LifePhase {
  String get label {
    switch (this) {
      case LifePhase.adolescente:
        return 'Adolescente';
      case LifePhase.adulta:
        return 'Adulta';
      case LifePhase.gestante:
        return 'Gestante';
      case LifePhase.tentante:
        return 'Tentante';
      case LifePhase.climaterio:
        return 'Climatério / Menopausa';
      case LifePhase.senescencia:
        return 'Senescência';
    }
  }

  IconData get icon {
    switch (this) {
      case LifePhase.adolescente:
        return Icons.school_outlined;
      case LifePhase.adulta:
        return Icons.woman_outlined;
      case LifePhase.gestante:
        return Icons.pregnant_woman_outlined;
      case LifePhase.tentante:
        return Icons.favorite_border;
      case LifePhase.climaterio:
        return Icons.spa_outlined;
      case LifePhase.senescencia:
        return Icons.elderly_woman_outlined;
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LifePhase _selectedPhase = LifePhase.adulta;

  static const Map<LifePhase, List<_QuickCard>> _phaseCards = {
    LifePhase.adolescente: [
      _QuickCard(
        icon: Icons.calendar_month,
        title: 'Meu Ciclo',
        subtitle: 'Acompanhe sua menstruação',
      ),
      _QuickCard(
        icon: Icons.menu_book,
        title: 'Entenda seu corpo',
        subtitle: 'Conteúdos para adolescentes',
      ),
      _QuickCard(
        icon: Icons.shield_outlined,
        title: 'Prevenção',
        subtitle: 'HPV, contraceptivos e mais',
      ),
    ],
    LifePhase.adulta: [
      _QuickCard(
        icon: Icons.calendar_month,
        title: 'Calendário Menstrual',
        subtitle: 'Registrar ciclo',
      ),
      _QuickCard(
        icon: Icons.alarm,
        title: 'Lembretes',
        subtitle: 'Anticoncepcional e consultas',
      ),
      _QuickCard(
        icon: Icons.search,
        title: 'Rastreamento',
        subtitle: 'Câncer de mama e colo',
      ),
    ],
    LifePhase.gestante: [
      _QuickCard(
        icon: Icons.baby_changing_station,
        title: 'Acompanhamento',
        subtitle: 'Semanas de gestação',
      ),
      _QuickCard(
        icon: Icons.local_hospital,
        title: 'Pré-natal',
        subtitle: 'Consultas e exames',
      ),
      _QuickCard(
        icon: Icons.menu_book,
        title: 'Gestação saudável',
        subtitle: 'Alimentação e cuidados',
      ),
    ],
    LifePhase.tentante: [
      _QuickCard(
        icon: Icons.calendar_month,
        title: 'Período fértil',
        subtitle: 'Calcule sua janela fértil',
      ),
      _QuickCard(
        icon: Icons.favorite,
        title: 'Dicas de concepção',
        subtitle: 'Hábitos e orientações',
      ),
      _QuickCard(
        icon: Icons.local_hospital,
        title: 'Quando consultar',
        subtitle: 'Sinais de atenção',
      ),
    ],
    LifePhase.climaterio: [
      _QuickCard(
        icon: Icons.spa,
        title: 'Climatério',
        subtitle: 'Sintomas e cuidados',
      ),
      _QuickCard(
        icon: Icons.monitor_heart,
        title: 'Saúde cardiovascular',
        subtitle: 'Riscos e prevenção',
      ),
      _QuickCard(
        icon: Icons.self_improvement,
        title: 'Qualidade de vida',
        subtitle: 'Autocuidado na menopausa',
      ),
    ],
    LifePhase.senescencia: [
      _QuickCard(
        icon: Icons.accessibility,
        title: 'Mobilidade',
        subtitle: 'Exercícios e prevenção de quedas',
      ),
      _QuickCard(
        icon: Icons.monitor_heart,
        title: 'Saúde integral',
        subtitle: 'Rastreamentos e vacinas',
      ),
      _QuickCard(
        icon: Icons.support_agent,
        title: 'Rede de apoio',
        subtitle: 'Contatos e serviços',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Saúde Feminina'),
        actions: [
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SafetyBanner(),
          const SectionTitle('Sua fase de vida'),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: LifePhase.values.map((phase) {
                final selected = phase == _selectedPhase;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedPhase = phase),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? cs.primary : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selected ? cs.primary : cs.primaryContainer,
                          width: 2,
                        ),
                        boxShadow: selected
                            ? [
                                BoxShadow(
                                  color: cs.primary.withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                )
                              ]
                            : [],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            phase.icon,
                            color:
                                selected ? Colors.white : cs.primary,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            phase.label,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: selected ? Colors.white : cs.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SectionTitle('Acesso rápido'),
          ...(_phaseCards[_selectedPhase] ?? []).map((card) => _QuickCardTile(card: card)),
          const SectionTitle('Dúvida anônima'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: cs.primaryContainer,
                  child: Icon(Icons.help_outline, color: cs.primary),
                ),
                title: const Text(
                  'Enviar uma dúvida anônima',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                    'Tire suas dúvidas com orientações educativas'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showAnonymousQuestion(context),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showAnonymousQuestion(BuildContext context) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dúvida anônima',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sua pergunta será respondida com base em conteúdo educativo. '
              'Nenhum dado pessoal é coletado.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Digite sua dúvida aqui...',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Dúvida enviada! Em breve você receberá orientações.'),
                    ),
                  );
                },
                child: const Text('Enviar dúvida'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickCard {
  final IconData icon;
  final String title;
  final String subtitle;
  const _QuickCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _QuickCardTile extends StatelessWidget {
  const _QuickCardTile({required this.card});
  final _QuickCard card;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: cs.primaryContainer,
          child: Icon(card.icon, color: cs.primary),
        ),
        title: Text(card.title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(card.subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
