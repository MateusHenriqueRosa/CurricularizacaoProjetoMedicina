import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: 'Minha Saúde');
  LifePhase _phase = LifePhase.adulta;
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: cs.primaryContainer,
                  child: Icon(Icons.person, size: 56, color: cs.primary),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: cs.primary,
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _nameController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Seu nome',
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            'Fase de vida',
            Icons.woman_outlined,
            child: InputDecorator(
              decoration: const InputDecoration(labelText: 'Selecione sua fase'),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LifePhase>(
                  value: _phase,
                  isDense: true,
                  isExpanded: true,
                  items: LifePhase.values
                      .map((p) => DropdownMenuItem(
                            value: p,
                            child: Row(
                              children: [
                                Icon(p.icon, size: 18, color: cs.primary),
                                const SizedBox(width: 8),
                                Text(p.label),
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _phase = v!),
                ),
              ),
            ),
          ),
          _buildSection(
            context,
            'Configurações',
            Icons.settings_outlined,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Notificações'),
                  subtitle: const Text('Lembretes e alertas'),
                  value: _notificationsEnabled,
                  activeThumbColor: cs.primary,
                  onChanged: (v) => setState(() => _notificationsEnabled = v),
                ),
                SwitchListTile(
                  title: const Text('Modo escuro'),
                  subtitle: const Text('(Em breve)'),
                  value: _darkMode,
                  activeThumbColor: cs.primary,
                  onChanged: null,
                ),
              ],
            ),
          ),
          _buildSection(
            context,
            'Sobre o app',
            Icons.info_outline,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AboutTile(
                  icon: Icons.people_outline,
                  label: 'Desenvolvido por',
                  value: 'Arthur Cervi, Luan Neves e Mateus Rosa',
                ),
                _AboutTile(
                  icon: Icons.school_outlined,
                  label: 'Contexto',
                  value: 'Curricularização da Extensão — Sistemas de Informação e Medicina',
                ),
                _AboutTile(
                  icon: Icons.local_hospital_outlined,
                  label: 'Base clínica',
                  value: 'Protocolos MS, INCA e SUS',
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Este app não substitui avaliação médica. '
                    'Procure sempre a UBS para diagnóstico e acompanhamento.',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Perfil salvo com sucesso!')),
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar perfil'),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    IconData icon, {
    required Widget child,
  }) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: cs.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: cs.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutTile extends StatelessWidget {
  const _AboutTile({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.black45),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.black45)),
                Text(value,
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
