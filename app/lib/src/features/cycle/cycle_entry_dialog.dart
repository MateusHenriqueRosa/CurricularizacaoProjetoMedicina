import 'package:flutter/material.dart';
import 'cycle_screen.dart';

class CycleEntryDialog extends StatefulWidget {
  const CycleEntryDialog({super.key, required this.date});
  final DateTime date;

  @override
  State<CycleEntryDialog> createState() => _CycleEntryDialogState();
}

class _CycleEntryDialogState extends State<CycleEntryDialog> {
  String _intensity = 'Moderada';
  final Set<String> _selectedSymptoms = {};

  static const _intensities = ['Leve', 'Moderada', 'Intensa', 'Muito intensa', 'Sem fluxo'];

  static const _symptoms = [
    'Cólica',
    'Dor de cabeça',
    'Inchaço',
    'Alteração de humor',
    'Náusea',
    'Fadiga',
    'Dor nas costas',
    'Sensibilidade nos seios',
    'Acne',
    'Insônia',
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text(
        'Registro - ${widget.date.day}/${widget.date.month}/${widget.date.year}',
        style: const TextStyle(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Intensidade do fluxo',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: cs.primary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: _intensities.map((i) {
                final selected = i == _intensity;
                return ChoiceChip(
                  label: Text(i),
                  selected: selected,
                  selectedColor: cs.primaryContainer,
                  onSelected: (_) => setState(() => _intensity = i),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Sintomas',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: cs.primary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: _symptoms.map((s) {
                final selected = _selectedSymptoms.contains(s);
                return FilterChip(
                  label: Text(s),
                  selected: selected,
                  selectedColor: cs.primaryContainer,
                  onSelected: (v) => setState(() {
                    if (v) {
                      _selectedSymptoms.add(s);
                    } else {
                      _selectedSymptoms.remove(s);
                    }
                  }),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            CycleEntry(
              date: widget.date,
              intensity: _intensity,
              symptoms: _selectedSymptoms.toList(),
            ),
          ),
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
