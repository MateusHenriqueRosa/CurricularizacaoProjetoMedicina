import 'package:flutter/material.dart';
import '../../components/section_title.dart';

enum ReminderType {
  anticoncepcional,
  consulta,
  exame,
  vacina,
  outro,
}

extension ReminderTypeInfo on ReminderType {
  String get label {
    switch (this) {
      case ReminderType.anticoncepcional:
        return 'Anticoncepcional';
      case ReminderType.consulta:
        return 'Consulta médica';
      case ReminderType.exame:
        return 'Exame preventivo';
      case ReminderType.vacina:
        return 'Vacina';
      case ReminderType.outro:
        return 'Outro';
    }
  }

  IconData get icon {
    switch (this) {
      case ReminderType.anticoncepcional:
        return Icons.medication_outlined;
      case ReminderType.consulta:
        return Icons.local_hospital_outlined;
      case ReminderType.exame:
        return Icons.assignment_outlined;
      case ReminderType.vacina:
        return Icons.vaccines_outlined;
      case ReminderType.outro:
        return Icons.alarm_outlined;
    }
  }

  Color get color {
    switch (this) {
      case ReminderType.anticoncepcional:
        return const Color(0xFFC43A4A);
      case ReminderType.consulta:
        return const Color(0xFFC56682);
      case ReminderType.exame:
        return const Color(0xFFE7A48C);
      case ReminderType.vacina:
        return const Color(0xFF6BAE75);
      case ReminderType.outro:
        return const Color(0xFF7B9EC9);
    }
  }
}

class Reminder {
  final String id;
  final String title;
  final ReminderType type;
  final TimeOfDay time;
  final List<int> weekdays;
  bool active;

  Reminder({
    required this.id,
    required this.title,
    required this.type,
    required this.time,
    required this.weekdays,
    this.active = true,
  });
}

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Reminder> _reminders = [
    Reminder(
      id: '1',
      title: 'Tomar anticoncepcional',
      type: ReminderType.anticoncepcional,
      time: const TimeOfDay(hour: 8, minute: 0),
      weekdays: [1, 2, 3, 4, 5, 6, 7],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lembretes')),
      body: _reminders.isEmpty
          ? _buildEmpty(context)
          : ListView(
              children: [
                const SectionTitle('Meus lembretes'),
                ..._reminders.map((r) => _ReminderTile(
                      reminder: r,
                      onToggle: (v) => setState(() => r.active = v),
                      onDelete: () => setState(() => _reminders.remove(r)),
                    )),
                const SizedBox(height: 80),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddReminder(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_alarm),
        label: const Text('Novo lembrete'),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.alarm_off, size: 64, color: cs.primaryContainer),
          const SizedBox(height: 16),
          const Text(
            'Nenhum lembrete cadastrado.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const Text(
            'Adicione lembretes para anticoncepcional,\nconsultas e exames preventivos.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }

  void _showAddReminder(BuildContext context) {
    final titleController = TextEditingController();
    ReminderType selectedType = ReminderType.anticoncepcional;
    TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
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
                'Novo lembrete',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Título do lembrete',
                  hintText: 'Ex: Tomar anticoncepcional',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Tipo:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: ReminderType.values.map((t) {
                  final selected = t == selectedType;
                  return ChoiceChip(
                    avatar: Icon(t.icon, size: 16,
                        color: selected ? Colors.white : t.color),
                    label: Text(t.label),
                    selected: selected,
                    selectedColor: t.color,
                    labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black87),
                    onSelected: (_) =>
                        setModalState(() => selectedType = t),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Horário:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final t = await showTimePicker(
                        context: ctx,
                        initialTime: selectedTime,
                      );
                      if (t != null) setModalState(() => selectedTime = t);
                    },
                    icon: const Icon(Icons.access_time),
                    label: Text(selectedTime.format(ctx)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.trim().isEmpty) return;
                    setState(() {
                      _reminders.add(Reminder(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text.trim(),
                        type: selectedType,
                        time: selectedTime,
                        weekdays: [1, 2, 3, 4, 5, 6, 7],
                      ));
                    });
                    Navigator.pop(ctx);
                  },
                  child: const Text('Salvar lembrete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReminderTile extends StatelessWidget {
  const _ReminderTile({
    required this.reminder,
    required this.onToggle,
    required this.onDelete,
  });
  final Reminder reminder;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: reminder.type.color.withValues(alpha: 0.15),
          child: Icon(reminder.type.icon, color: reminder.type.color),
        ),
        title: Text(
          reminder.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: reminder.active ? Colors.black87 : Colors.black38,
            decoration:
                reminder.active ? null : TextDecoration.lineThrough,
          ),
        ),
        subtitle: Text(
          '${reminder.type.label} • ${reminder.time.format(context)}',
          style: TextStyle(
            color: reminder.active ? Colors.black54 : Colors.black26,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: reminder.active,
              onChanged: onToggle,
              activeThumbColor: reminder.type.color,
            ),
            IconButton(
              tooltip: 'Excluir',
              icon: const Icon(Icons.delete_outline, color: Colors.black38),
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Excluir lembrete?'),
                  content: Text(
                      'Deseja excluir o lembrete "${reminder.title}"?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        onDelete();
                      },
                      child: const Text('Excluir'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
