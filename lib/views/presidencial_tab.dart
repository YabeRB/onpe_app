import 'package:flutter/material.dart';
import '../colors.dart';

class PresidencialTab extends StatefulWidget {
  const PresidencialTab({super.key});

  @override
  State<PresidencialTab> createState() => _PresidencialTabState();
}

class _PresidencialTabState extends State<PresidencialTab> {
  int _vistaActual = 0;

  String _ambitoSeleccionado = 'TODOS';

  final List<Map<String, dynamic>> datosContinentes = [
    {'cont': 'AFRICA', 'ppk': '21', 'keiko': '10', 'blancos': '0', 'nulos': '2', 'isTotal': false},
    {'cont': 'AMERICA', 'ppk': '161,280', 'keiko': '88,973', 'blancos': '1,664', 'nulos': '17,802', 'isTotal': false},
    {'cont': 'ASIA', 'ppk': '1,720', 'keiko': '7,665', 'blancos': '41', 'nulos': '417', 'isTotal': false},
    {'cont': 'EUROPA', 'ppk': '69,252', 'keiko': '42,008', 'blancos': '835', 'nulos': '6,423', 'isTotal': false},
    {'cont': 'OCEANIA', 'ppk': '1,387', 'keiko': '616', 'blancos': '13', 'nulos': '109', 'isTotal': false},
    {'cont': 'TOTAL', 'ppk': '233,660', 'keiko': '139,272', 'blancos': '2,553', 'nulos': '24,753', 'isTotal': true},
  ];

  final Map<String, Map<String, dynamic>> datosTipoVotos = {
    'TODOS': {
      'val_votos': '17,152,817', 'val_pct': '93.512%', 'val_num': 0.93512,
      'bla_votos': '149,577', 'bla_pct': '0.815%', 'bla_num': 0.00815,
      'nul_votos': '1,040,502', 'nul_pct': '5.673%', 'nul_num': 0.05673,
      'tot_votos': '18,342,896'
    },
    'PERÚ': {
      'val_votos': '16,802,878', 'val_pct': '93.592%', 'val_num': 0.93592,
      'bla_votos': '147,185', 'bla_pct': '0.820%', 'bla_num': 0.00820,
      'nul_votos': '1,003,304', 'nul_pct': '5.588%', 'nul_num': 0.05588,
      'tot_votos': '17,953,367'
    },
    'EXTRANJERO': {
      'val_votos': '349,939', 'val_pct': '89.836%', 'val_num': 0.89836,
      'bla_votos': '2,392', 'bla_pct': '0.614%', 'bla_num': 0.00614,
      'nul_votos': '37,198', 'nul_pct': '9.549%', 'nul_num': 0.09549,
      'tot_votos': '389,5297'
    }
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterButton('RESUMEN GENERAL', _vistaActual == 0, () {
                setState(() => _vistaActual = 0);
              }),
              const SizedBox(width: 8),
              _buildFilterButton('RESULTADOS PRESIDENCIALES', _vistaActual == 1, () {
                setState(() => _vistaActual = 1);
              }),
              const SizedBox(width: 8),
              _buildFilterButton('RESULTADOS POR TIPO DE VOTOS', _vistaActual == 2, () {
                setState(() => _vistaActual = 2);
              }),
            ],
          ),
        ),
        const SizedBox(height: 20),

        if (_vistaActual == 0) _buildResumenGeneralContent(),
        if (_vistaActual == 1) _buildResultadosPresidencialesContent(),
        if (_vistaActual == 2) _buildTipoDeVotosContent(),
      ],
    );
  }

  Widget _buildResumenGeneralContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  Widget _buildResultadosPresidencialesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESULTADOS PRESIDENCIALES',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
        ),
        const SizedBox(height: 16),

        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TOTAL DE VOTOS VÁLIDOS',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
                ),
                const Divider(thickness: 1, height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(160),
                      1: FixedColumnWidth(80),
                      2: FixedColumnWidth(90),
                      3: FixedColumnWidth(90),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        children: [
                          _buildTableCell('ORGANIZACIÓN\nPOLÍTICA', isHeader: true),
                          _buildTableCell('TOTAL', isHeader: true, alignRight: true),
                          _buildTableCell('% VOTOS\nVÁLIDOS', isHeader: true, alignRight: true),
                          _buildTableCell('% VOTOS\nEMITIDOS', isHeader: true, alignRight: true),
                        ],
                      ),
                      _buildTableRowData4('PERUANOS POR EL KAMBIO', '8,596,937', '50.120%', '46.868%'),
                      _buildTableRowData4('FUERZA POPULAR', '8,555,880', '49.880%', '46.644%'),
                      _buildTableRowData4('TOTAL DE VOTOS VÁLIDOS', '17,152,817', '100.000%', '93.512%', isBold: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TOTAL DE VOTOS EMITIDOS',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
                ),
                const Divider(thickness: 1, height: 24),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1.2),
                    2: FlexColumnWidth(1.2),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey.shade100),
                      children: [
                        _buildTableCell('DETALLE', isHeader: true),
                        _buildTableCell('TOTAL', isHeader: true, alignRight: true),
                        _buildTableCell('% VOTOS\nEMITIDOS', isHeader: true, alignRight: true),
                      ],
                    ),
                    _buildTableRowData('VOTOS BLANCOS', '149,577', '0.815%'),
                    _buildTableRowData('VOTOS NULOS', '1,040,502', '5.673%'),
                    _buildTableRowData('VOTOS VÁLIDOS', '17,152,817', '93.512%'),
                    _buildTableRowData('TOTAL VOTOS EMITIDOS', '18,342,896', '100.000%', isBold: true),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        Card(
          elevation: 2,
          color: Colors.blue.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: OnpeColors.navbarBlue,
              collapsedIconColor: OnpeColors.navbarBlue,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              title: const Row(
                children: [
                  Icon(Icons.info_outline, color: OnpeColors.navbarBlue),
                  SizedBox(width: 8),
                  Text(
                    'GLOSARIO',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
                  ),
                ],
              ),
              childrenPadding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              children: [
                const Divider(thickness: 1, height: 16),
                const SizedBox(height: 8),
                _buildGlosarioItem('ACTA CON VOTOS IMPUGNADOS:', 'Acta con votos impugnados.'),
                _buildGlosarioItem('ACTA CON ERROR MATERIAL:', 'Con inconsistencias en los datos numéricos consignados.'),
                _buildGlosarioItem('ACTA CON ILEGIBILIDAD:', 'Es aquella que contiene datos ilegibles.'),
                _buildGlosarioItem('ACTA INCOMPLETA:', 'No consigna el total de ciudadanos que votaron.'),
                _buildGlosarioItem('ACTA CON SOLICITUD DE NULIDAD:', 'Acta con solicitud de nulidad de la mesa, realizada de manera expresa en el espacio de observadores.'),
                _buildGlosarioItem('ACTA EXTRAVIADA:', 'La que no llega a la ODPE y es declarada como tal por el Jefe de la ODPE.'),
                _buildGlosarioItem('ACTA SINIESTRADA:', 'Acta que corresponde a una mesa de sufragio y que debido a hecho de violencia y/o atentado contra el Derecho al Sufragio que haya afectado el material electoral, no han podido ser entregadas a la ODPE o ingresadas al sistema de cómputo electoral para su procesamiento.'),
                _buildGlosarioItem('ACTA SIN FIRMAS:', 'No se considera como acta observada cuando el acta de instalación, sufragio o escrutinio cuentan con por lo menos las firmas, el nombre y número de DNI de los tres miembros de mesa, en cualesquiera de estas, y en las otras dos restantes, los datos y las firmas de por lo menos dos miembros de la mesa.'),
                _buildGlosarioItem('CON MÁS DE UNA OBSERVACIÓN:', 'Aquella acta que presenta alguna combinación de las observaciones anteriormente mencionadas.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipoDeVotosContent() {
    final currentData = datosTipoVotos[_ambitoSeleccionado]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RESULTADOS POR TIPO DE VOTOS',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
        ),
        const SizedBox(height: 16),

        const Text('ÁMBITO:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _ambitoSeleccionado,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: OnpeColors.navbarBlue),
              items: ['TODOS', 'PERÚ', 'EXTRANJERO'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue)),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _ambitoSeleccionado = newValue!;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 24),

        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildHorizontalBar('VOTOS VÁLIDOS', currentData['val_pct'], currentData['val_num'], Colors.blue),
                const SizedBox(height: 20),
                _buildHorizontalBar('VOTOS BLANCOS', currentData['bla_pct'], currentData['bla_num'], Colors.grey.shade400),
                const SizedBox(height: 20),
                _buildHorizontalBar('VOTOS NULOS', currentData['nul_pct'], currentData['nul_num'], Colors.redAccent),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // TABLA GENERAL DE DATOS
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2.2),
                1: FlexColumnWidth(1.4),
                2: FlexColumnWidth(1.4),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  children: [
                    _buildTableCell('DETALLE', isHeader: true),
                    _buildTableCell('TOTAL', isHeader: true, alignRight: true),
                    _buildTableCell('% VOTOS\nEMITIDOS', isHeader: true, alignRight: true),
                  ],
                ),
                _buildTableRowData('VOTOS VÁLIDOS', currentData['val_votos'], currentData['val_pct']),
                _buildTableRowData('VOTOS BLANCOS', currentData['bla_votos'], currentData['bla_pct']),
                _buildTableRowData('VOTOS NULOS', currentData['nul_votos'], currentData['nul_pct']),
                _buildTableRowData('TOTAL VOTOS EMITIDOS', currentData['tot_votos'], '100.000%', isBold: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalBar(String nombre, String porcentajeTxt, double valor, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: OnpeColors.navbarBlue)),
            Text(porcentajeTxt, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: valor,
            minHeight: 12,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Widget _buildGlosarioItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
          children: [
            TextSpan(text: '$title ', style: const TextStyle(fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue)),
            TextSpan(text: description),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? OnpeColors.navbarBlue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? OnpeColors.navbarBlue : Colors.grey.shade300),
        ),
      ),
      onPressed: onTap,
      child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover, alignment: Alignment.center),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: OnpeColors.navbarBlue)),
                  const SizedBox(height: 4),
                  Text('VOTOS: $votos', style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            Text(porcentaje, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: OnpeColors.lightBlue)),
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
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue)),
            const Divider(thickness: 1, height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: charts),
            const SizedBox(height: 24),
            Table(
              columnWidths: const {0: FlexColumnWidth(2.2), 1: FlexColumnWidth(1.6), 2: FlexColumnWidth(1.8)},
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
              child: CircularProgressIndicator(value: valor, strokeWidth: 6, backgroundColor: Colors.grey.shade200, color: color),
            ),
            Text(porcentaje.split('%')[0] + '%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
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
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, color: isHeader ? OnpeColors.navbarBlue : Colors.black87, fontSize: 10.5),
      ),
    );
  }

  TableRow _buildTableRowData(String titulo, String total, String porcentaje, {bool isBold = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isBold ? Colors.blue.shade50 : null, border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      children: [
        _buildTableCell(titulo),
        _buildTableCell(total, alignRight: true),
        _buildTableCell(porcentaje, alignRight: true),
      ],
    );
  }

  TableRow _buildTableRowData4(String col1, String col2, String col3, String col4, {bool isBold = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isBold ? Colors.blue.shade50 : null, border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          child: Text(col1, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 10.5)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          child: Text(col2, textAlign: TextAlign.right, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 10.5)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          child: Text(col3, textAlign: TextAlign.right, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 10.5)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          child: Text(col4, textAlign: TextAlign.right, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontSize: 10.5)),
        ),
      ],
    );
  }
}