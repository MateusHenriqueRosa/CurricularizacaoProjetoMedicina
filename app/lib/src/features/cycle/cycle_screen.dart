import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../components/safety_banner.dart';
import '../../components/section_title.dart';
import 'cycle_entry_dialog.dart';

class CycleEntry {
  final DateTime date;
  final String intensity;
  final List<String> symptoms;
  const CycleEntry({
    required this.date,
    required this.intensity,
    required this.symptoms,
  });
}

class CycleScreen extends StatefulWidget {
  const CycleScreen({super.key});

  @override
  State<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, CycleEntry> _entries = {};

  DateTime _normalize(DateTime d) => DateTime(d.year, d.month, d.day);

  bool _hasEntry(DateTime day) => _entries.containsKey(_normalize(day));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Ciclo Menstrual')),
      body: ListView(
        children: [
          const SafetyBanner(),
          TableCalendar(
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selected, focused) {
              setState(() {
                _selectedDay = selected;
                _focusedDay = focused;
              });
            },
            onPageChanged: (focused) =>
                setState(() => _focusedDay = focused),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: cs.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: cs.primaryContainer,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(color: cs.primary),
              markerDecoration: BoxDecoration(
                color: cs.secondary,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: cs.primary,
                fontSize: 16,
              ),
              leftChevronIcon: Icon(Icons.chevron_left, color: cs.primary),
              rightChevronIcon: Icon(Icons.chevron_right, color: cs.primary),
            ),
            eventLoader: (day) =>
                _hasEntry(day) ? [_entries[_normalize(day)]!] : [],
          ),
          if (_selectedDay != null) _buildSelectedDayInfo(context),
          const SectionTitle('Análise do ciclo'),
          _buildAnalysisCard(context),
          const SizedBox(height: 24),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openEntry,
        backgroundColor: cs.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Registrar'),
      ),
    );
  }

  Widget _buildSelectedDayInfo(BuildContext context) {
    final key = _normalize(_selectedDay!);
    final entry = _entries[key];
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _formatDate(_selectedDay!),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: cs.primary,
              ),
            ),
            const SizedBox(height: 8),
            if (entry == null)
              const Text('Nenhum registro para este dia.')
            else ...[
              Row(
                children: [
                  const Icon(Icons.water_drop, size: 16, color: Color(0xFFC43A4A)),
                  const SizedBox(width: 4),
                  Text('Intensidade: ${entry.intensity}'),
                ],
              ),
              if (entry.symptoms.isNotEmpty) ...[
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  children: entry.symptoms
                      .map((s) => Chip(label: Text(s)))
                      .toList(),
                ),
              ],
            ],
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _openEntry,
              icon: Icon(entry == null ? Icons.add : Icons.edit),
              label: Text(entry == null ? 'Adicionar registro' : 'Editar registro'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalysisCard(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final count = _entries.length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  label: 'Registros',
                  value: '$count',
                  icon: Icons.edit_note,
                  color: cs.primary,
                ),
                _StatItem(
                  label: 'Ciclo médio',
                  value: count > 1 ? '28 dias' : '--',
                  icon: Icons.loop,
                  color: cs.secondary,
                ),
                _StatItem(
                  label: 'Último ciclo',
                  value: count > 0 ? '${_entries.keys.last.day}/${_entries.keys.last.month}' : '--',
                  icon: Icons.history,
                  color: const Color(0xFFE7A48C),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openEntry() async {
    final result = await showDialog<CycleEntry>(
      context: context,
      builder: (_) => CycleEntryDialog(date: _selectedDay ?? DateTime.now()),
    );
    if (result != null) {
      setState(() => _entries[_normalize(result.date)] = result);
    }
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
