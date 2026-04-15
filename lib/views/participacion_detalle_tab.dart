import 'package:flutter/material.dart';
import '../colors.dart';

class DetalleParticipacion {
  final String ambito;
  final String habiles;
  final String votaron;
  final String partPct;
  final String ausentes;
  final String ausPct;
  final bool isTotal;

  const DetalleParticipacion(this.ambito, this.habiles, this.votaron, this.partPct, this.ausentes, this.ausPct, {this.isTotal = false});
}

class ParticipacionDetalleTab extends StatelessWidget {
  final String title;
  final List<DetalleParticipacion> data;

  const ParticipacionDetalleTab({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OnpeColors.navbarBlue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 4,
            color: OnpeColors.yellowStrip,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'RESULTADOS DETALLADOS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: OnpeColors.navbarBlue,
                  ),
                ),
                const SizedBox(height: 16),

                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(label: Text('ÁMBITO', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                        DataColumn(label: Text('ELECTORES\nHÁBILES', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                        DataColumn(label: Text('CIUDADANOS\nQUE VOTARON', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                        DataColumn(label: Text('% DE\nPARTICIPACIÓN', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                        DataColumn(label: Text('CIUDADANOS\nAUSENTES', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                        DataColumn(label: Text('% DE\nAUSENTISMO', style: TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue, fontSize: 12))),
                      ],
                      rows: data.map((item) {
                        return DataRow(
                          color: item.isTotal ? MaterialStateProperty.all(Colors.blue.shade50) : null,
                          cells: [
                            DataCell(Text(item.ambito, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.w500))),
                            DataCell(Text(item.habiles, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.normal))),
                            DataCell(Text(item.votaron, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.normal))),
                            DataCell(Text(item.partPct, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.normal))),
                            DataCell(Text(item.ausentes, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.normal))),
                            DataCell(Text(item.ausPct, style: TextStyle(fontWeight: item.isTotal ? FontWeight.bold : FontWeight.normal))),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}