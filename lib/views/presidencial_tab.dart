import 'package:flutter/material.dart';
import '../colors.dart';

class PresidencialTab extends StatelessWidget {
  const PresidencialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterButton('RESUMEN GENERAL', true),
              const SizedBox(width: 8),
              _buildFilterButton('RESULTADOS PRESIDENCIALES', false),
              const SizedBox(width: 8),
              _buildFilterButton('RESULTADOS POR TIPO DE VOTOS', false),
            ],
          ),
        ),
        const SizedBox(height: 20),

        _buildCandidateCard('PEDRO PABLO KUCZYNSKI', '50.120%', '8,596,937', 'assets/images/PPK.png'),
        const SizedBox(height: 12),
        _buildCandidateCard('KEIKO FUJIMORI', '49.880%', '8,555,880', 'assets/images/Keiko.png'),
        const SizedBox(height: 24),

        _buildEscrutinioSection(),
        const SizedBox(height: 24),
        _buildParticipacionSection(),
      ],
    );
  }

  Widget _buildFilterButton(String text, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? OnpeColors.navbarBlue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? OnpeColors.navbarBlue : Colors.grey.shade300,
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCandidateCard(String nombre, String porcentaje, String votos, String imagePath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey.shade300, width: 1),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: OnpeColors.navbarBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('VOTOS: $votos', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            Text(
              porcentaje,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: OnpeColors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEscrutinioSection() {
    return _buildSectionCard(
      title: 'AVANCE DE ESCRUTINIO',
      charts: [
        _buildCircularChart('Procesadas', '100.000%', 1.0),
        _buildCircularChart('Contabilizadas', '100.000%', 1.0),
      ],
      tableRows: [
        _buildTableRowData('Total de Actas', '77,307', '100.000%'),
        _buildTableRowData('Procesadas', '77,307', '100.000%'),
        _buildTableRowData('Contabilizadas', '77,307', '100.000%'),
      ],
    );
  }

  Widget _buildParticipacionSection() {
    return _buildSectionCard(
      title: 'PARTICIPACIÓN CIUDADANA',
      charts: [
        _buildCircularChart('Participación', '81.803%', 0.818),
        _buildCircularChart('Ausentismo', '18.197%', 0.181, color: Colors.orange),
      ],
      tableRows: [
        _buildTableRowData('Electores Hábiles', '22,901,954', '100.000%'),
        _buildTableRowData('Participación', '18,734,423', '81.803%'),
        _buildTableRowData('Ausentismo', '4,167,531', '18.197%'),
      ],
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> charts, required List<TableRow> tableRows}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
            ),
            const Divider(thickness: 1, height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: charts,
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
                ...tableRows,
              ],
            ),
          ],
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
        Text(
          titulo,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
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