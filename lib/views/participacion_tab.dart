import 'package:flutter/material.dart';
import '../colors.dart';
import 'participacion_detalle_tab.dart';

class ParticipacionTab extends StatelessWidget {
  const ParticipacionTab({super.key});

  final List<DetalleParticipacion> extranjeroData = const [
    DetalleParticipacion('AFRICA', '254', '33', '12.992%', '221', '87.008%'),
    DetalleParticipacion('AMERICA', '596,827', '269,733', '45.194%', '327,094', '54.806%'),
    DetalleParticipacion('ASIA', '33,656', '9,848', '29.260%', '23,808', '70.740%'),
    DetalleParticipacion('EUROPA', '248,753', '118,527', '47.648%', '130,226', '52.352%'),
    DetalleParticipacion('OCEANIA', '4,775', '2,126', '44.523%', '2,649', '55.477%'),
    DetalleParticipacion('TOTAL', '884,265', '400,267', '45.265%', '483,998', '54.735%', isTotal: true),
  ];

  final List<DetalleParticipacion> nacionalData = const [
    DetalleParticipacion('AMAZONAS', '284,813', '218,655', '76.771%', '66,158', '23.229%'),
    DetalleParticipacion('ANCASH', '818,289', '675,992', '82.610%', '142,297', '17.390%'),
    DetalleParticipacion('APURIMAC', '279,531', '225,584', '80.700%', '53,947', '19.300%'),
    DetalleParticipacion('AREQUIPA', '1,040,111', '896,871', '86.228%', '143,240', '13.772%'),
    DetalleParticipacion('AYACUCHO', '422,963', '318,172', '75.224%', '104,791', '24.776%'),
    DetalleParticipacion('TOTAL', '22,017,689', '18,342,629', '83.308%', '3,675,060', '16.692%', isTotal: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'RESUMEN GENERAL DE PARTICIPACIÓN',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        _buildResumenGlobal(),

        const SizedBox(height: 24),
        const Divider(thickness: 1),
        const SizedBox(height: 16),

        const Text(
          'DETALLE DE PARTICIPACIÓN',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(height: 16),

        _buildActionCard(
          context: context,
          title: 'Electores en el Extranjero',
          subtitle: 'Participación: 44.018%',
          iconData: Icons.public,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParticipacionDetalleTab(
                  title: 'Electores en el Extranjero',
                  data: extranjeroData,
                ),
              ),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParticipacionDetalleTab(
                  title: 'Electores Territorio Nacional',
                  data: nacionalData,
                ),
              ),
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