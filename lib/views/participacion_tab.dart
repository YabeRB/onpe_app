import 'package:flutter/material.dart';
import '../colors.dart';

class ParticipacionTab extends StatelessWidget {
  const ParticipacionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'RESUMEN GENERAL DE PARTICIPACIÓN',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: OnpeColors.navbarBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        _buildResumenGlobal(),

        const SizedBox(height: 24),
        const Divider(thickness: 1),
        const SizedBox(height: 16),

        const Text(
          'DETALLE DE PARTICIPACIÓN',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),

        _buildActionCard(
          context: context,
          title: 'Electores en el Extranjero',
          subtitle: 'Participación: 44.018%',
          iconData: Icons.public,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Abriendo detalle del extranjero...')),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildActionCard(
          context: context,
          title: 'Electores Territorio Nacional',
          subtitle: 'Participación: 81.543%',
          iconData: Icons.map_outlined,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Abriendo detalle nacional...')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildResumenGlobal() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularChart('Participación', '81.803%', 0.818),
                _buildCircularChart('Ausentismo', '18.197%', 0.181, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 24),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2.2),
                1: FlexColumnWidth(1.6),
                2: FlexColumnWidth(1.8),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  children: [
                    _buildTableCell('DETALLE', isHeader: true),
                    _buildTableCell('TOTAL', isHeader: true, alignRight: true),
                    _buildTableCell('PORCENTAJE', isHeader: true, alignRight: true),
                  ],
                ),
                _buildTableRowData('Electores Hábiles', '22,901,954', '100.000%'),
                _buildTableRowData('Ciudadanos que votaron', '18,342,896', '81.803%'),
                _buildTableRowData('Ciudadanos ausentes', '4,559,058', '18.197%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, size: 36, color: Colors.grey.shade600),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: OnpeColors.navbarBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularChart(String titulo, String porcentaje, double valor, {Color color = OnpeColors.lightBlue}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: CircularProgressIndicator(
                value: valor,
                strokeWidth: 6,
                backgroundColor: Colors.grey.shade200,
                color: color,
              ),
            ),
            Text(
              porcentaje.split('%')[0] + '%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(titulo, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false, bool alignRight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
      child: Text(
        text,
        textAlign: alignRight ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? OnpeColors.navbarBlue : Colors.black87,
          fontSize: 10.5,
        ),
      ),
    );
  }

  TableRow _buildTableRowData(String titulo, String total, String porcentaje) {
    return TableRow(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      children: [
        _buildTableCell(titulo),
        _buildTableCell(total, alignRight: true),
        _buildTableCell(porcentaje, alignRight: true),
      ],
    );
  }
}