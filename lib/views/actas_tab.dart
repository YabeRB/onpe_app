import 'package:flutter/material.dart';
import '../colors.dart';

class ActasTab extends StatelessWidget {
  const ActasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(height: 8),
        const Text(
          'CONSULTA DE ACTAS',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: OnpeColors.navbarBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        _buildUbigeoSearchCard(),

        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("O", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
            ),
            Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
          ],
        ),

        const SizedBox(height: 24),

        _buildNumeroActaSearchCard(),
      ],
    );
  }

  Widget _buildUbigeoSearchCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(width: 8),
                Text(
                  'Actas por Ubigeo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),

            _buildDropdown('Ámbito', 'Seleccione un ámbito'),
            const SizedBox(height: 12),
            _buildDropdown('Departamento', 'Seleccione departamento'),
            const SizedBox(height: 12),
            _buildDropdown('Provincia', 'Seleccione provincia'),
            const SizedBox(height: 12),
            _buildDropdown('Distrito', 'Seleccione distrito'),
            const SizedBox(height: 12),
            _buildDropdown('Locales', 'Seleccione local'),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: OnpeColors.navbarBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                },
                child: const Text('CONSULTAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumeroActaSearchCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(width: 8),
                Text(
                  'Actas por Número',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: OnpeColors.navbarBlue),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),

            const Text(
              'Ingrese el número del acta que desea consultar:',
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 12),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Ej. 000123',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: OnpeColors.navbarBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                },
                child: const Text('BUSCAR ACTA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,
          ),
          hint: Text(hint, style: const TextStyle(fontSize: 14)),
          items: const [],
          onChanged: (value) {},
        ),
      ],
    );
  }
}