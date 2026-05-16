import 'package:flutter/material.dart';
import '../../components/safety_banner.dart';
import 'article_detail_screen.dart';

class Article {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final IconData icon;

  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.icon,
  });
}

const _articles = [
  Article(
    id: '1',
    title: 'Corrimento vaginal: quando se preocupar?',
    summary: 'Aprenda a identificar sinais de normalidade e alertas.',
    content:
        'O corrimento vaginal é uma secreção natural produzida pelo organismo da mulher. '
        'O corrimento normal geralmente é transparente ou esbranquiçado, sem odor forte e sem causar coceira.\n\n'
        '**Sinais de alerta:**\n'
        '• Cor amarelada, esverdeada ou acinzentada\n'
        '• Odor forte ou desagradável (semelhante a peixe)\n'
        '• Coceira, ardência ou irritação na região\n'
        '• Consistência diferente do habitual\n\n'
        'Esses sinais podem indicar infecções como candidíase, vaginose bacteriana ou ISTs. '
        'Procure a UBS para avaliação e tratamento adequados.',
    category: 'Saúde íntima',
    icon: Icons.health_and_safety_outlined,
  ),
  Article(
    id: '2',
    title: 'Cólica e dor pélvica',
    summary: 'O que é normal e quando buscar ajuda.',
    content:
        'A cólica menstrual (dismenorreia) é uma dor na região abdominal inferior que ocorre antes ou durante a menstruação.\n\n'
        '**O que pode aliviar:**\n'
        '• Compressa quente na barriga\n'
        '• Exercícios leves (caminhada, yoga)\n'
        '• Analgésicos indicados pelo médico\n'
        '• Alimentação equilibrada\n\n'
        '**Quando procurar a UBS:**\n'
        '• Dor muito intensa que impede atividades diárias\n'
        '• Dor fora do período menstrual\n'
        '• Dor que piora com o tempo\n\n'
        'Dor pélvica persistente pode indicar endometriose ou outras condições que precisam de avaliação médica.',
    category: 'Ciclo menstrual',
    icon: Icons.healing_outlined,
  ),
  Article(
    id: '3',
    title: 'Atraso menstrual: o que pode causar?',
    summary: 'Entenda as causas além da gravidez.',
    content:
        'O atraso menstrual pode ter diversas causas além da gravidez:\n\n'
        '• **Estresse**: um dos fatores mais comuns\n'
        '• **Mudanças de peso**: ganho ou perda brusca de peso\n'
        '• **Exercício intenso**: atletas de alta performance\n'
        '• **Alterações hormonais**: SOP, tireoide\n'
        '• **Uso de anticoncepcionais**: especialmente após parar\n\n'
        'Se o atraso for superior a 5-7 dias, faça um teste de gravidez. '
        'Independentemente do resultado, procure a UBS para orientação.',
    category: 'Ciclo menstrual',
    icon: Icons.event_outlined,
  ),
  Article(
    id: '4',
    title: 'Prevenção do câncer de mama',
    summary: 'Como fazer o autoexame e quando fazer mamografia.',
    content:
        'O câncer de mama é o mais comum entre mulheres no Brasil. '
        'A detecção precoce aumenta muito as chances de cura.\n\n'
        '**Autoexame mensal:**\n'
        'Realize após a menstruação. Observe qualquer nódulo, alteração na pele, '
        'saída de líquido pelo mamilo ou assimetria.\n\n'
        '**Mamografia:**\n'
        '• Anual a partir dos 40 anos (ou conforme orientação médica)\n'
        '• A partir dos 35 para quem tem histórico familiar\n\n'
        'Procure a UBS para solicitar a mamografia pelo SUS.',
    category: 'Rastreamento',
    icon: Icons.monitor_heart_outlined,
  ),
  Article(
    id: '5',
    title: 'Prevenção do câncer de colo do útero',
    summary: 'Vacina HPV, Papanicolau e cuidados preventivos.',
    content:
        'O câncer de colo do útero é causado principalmente pelo HPV (papilomavírus humano) '
        'e é altamente prevenível.\n\n'
        '**Prevenção:**\n'
        '• **Vacina HPV**: disponível no SUS para meninas de 9 a 14 anos e meninos de 11 a 14 anos\n'
        '• **Papanicolau**: exame preventivo indicado a partir dos 25 anos, '
        'anualmente nos dois primeiros anos e depois a cada 3 anos\n'
        '• Uso de preservativo em todas as relações sexuais\n\n'
        'Agende seu Papanicolau na UBS. O exame é gratuito pelo SUS.',
    category: 'Rastreamento',
    icon: Icons.shield_outlined,
  ),
  Article(
    id: '6',
    title: 'Violência contra a mulher',
    summary: 'Reconheça, busque ajuda e conheça seus direitos.',
    content:
        'A violência contra a mulher é um problema de saúde pública. '
        'Ela pode ser física, psicológica, sexual, patrimonial ou moral.\n\n'
        '**Sinais de relacionamento abusivo:**\n'
        '• Controle excessivo sobre roupas, amigos, saídas\n'
        '• Xingamentos, humilhações e ameaças\n'
        '• Ciúme exagerado\n'
        '• Impedimento de trabalhar ou estudar\n\n'
        '**Onde buscar ajuda:**\n'
        '• **Ligue 180**: Central de Atendimento à Mulher (24h)\n'
        '• **Ligue 190**: Polícia Militar\n'
        '• CRAM, DEAM, Casas-abrigo\n'
        '• UBS: acolhimento e encaminhamentos\n\n'
        'Você não está sozinha. Peça ajuda.',
    category: 'Apoio e direitos',
    icon: Icons.support_outlined,
  ),
  Article(
    id: '7',
    title: 'TPM e alterações emocionais',
    summary: 'Como lidar com a tensão pré-menstrual.',
    content:
        'A Tensão Pré-Menstrual (TPM) ocorre nos dias que antecedem a menstruação '
        'devido a alterações hormonais.\n\n'
        '**Sintomas comuns:**\n'
        '• Irritabilidade, ansiedade ou tristeza\n'
        '• Inchaço abdominal\n'
        '• Sensibilidade nas mamas\n'
        '• Cólica, dor de cabeça, fadiga\n'
        '• Desejo por alimentos específicos\n\n'
        '**Como aliviar:**\n'
        '• Pratique atividade física regularmente\n'
        '• Reduza cafeína, sal e açúcar nos dias antes\n'
        '• Durma bem e pratique técnicas de relaxamento\n'
        '• Converse com seu médico sobre opções de tratamento',
    category: 'Saúde emocional',
    icon: Icons.psychology_outlined,
  ),
  Article(
    id: '8',
    title: 'Climatério e menopausa',
    summary: 'Entenda essa fase e como cuidar da sua saúde.',
    content:
        'O climatério é a fase de transição entre o período reprodutivo e o não reprodutivo. '
        'A menopausa é a última menstruação, confirmada após 12 meses sem menstruar.\n\n'
        '**Sintomas comuns:**\n'
        '• Ondas de calor (fogachos)\n'
        '• Suores noturnos\n'
        '• Ressecamento vaginal\n'
        '• Alterações de humor\n'
        '• Dificuldade para dormir\n\n'
        '**Cuidados importantes:**\n'
        '• Manter atividade física\n'
        '• Alimentação rica em cálcio e vitamina D\n'
        '• Acompanhamento médico regular\n'
        '• Conversar com o médico sobre terapia hormonal\n\n'
        'Procure a UBS para orientação e acompanhamento.',
    category: 'Fases da vida',
    icon: Icons.spa_outlined,
  ),
];

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String _search = '';
  String? _selectedCategory;

  List<Article> get _filtered {
    return _articles.where((a) {
      final matchSearch = _search.isEmpty ||
          a.title.toLowerCase().contains(_search.toLowerCase()) ||
          a.summary.toLowerCase().contains(_search.toLowerCase());
      final matchCategory =
          _selectedCategory == null || a.category == _selectedCategory;
      return matchSearch && matchCategory;
    }).toList();
  }

  List<String> get _categories =>
      _articles.map((a) => a.category).toSet().toList();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Educação em Saúde')),
      body: Column(
        children: [
          const SafetyBanner(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (v) => setState(() => _search = v),
              decoration: const InputDecoration(
                hintText: 'Buscar conteúdos...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: const Text('Todos'),
                    selected: _selectedCategory == null,
                    onSelected: (_) =>
                        setState(() => _selectedCategory = null),
                  ),
                ),
                ..._categories.map((cat) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(cat),
                        selected: _selectedCategory == cat,
                        onSelected: (_) => setState(
                            () => _selectedCategory =
                                _selectedCategory == cat ? null : cat),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off, size: 48, color: cs.primary),
                        const SizedBox(height: 8),
                        const Text('Nenhum conteúdo encontrado.'),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (ctx, i) {
                      final article = _filtered[i];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: cs.primaryContainer,
                            child: Icon(article.icon, color: cs.primary),
                          ),
                          title: Text(
                            article.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article.summary),
                              const SizedBox(height: 4),
                              Chip(
                                label: Text(article.category),
                                padding: EdgeInsets.zero,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ArticleDetailScreen(article: article),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
