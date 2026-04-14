import 'package:flutter/material.dart';
import 'colors.dart';
import 'views/presidencial_tab.dart';
import 'views/actas_tab.dart';
import 'views/participacion_tab.dart';

void main() {
  runApp(const OnpeApp());
}

class OnpeApp extends StatelessWidget {
  const OnpeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ONPE Resultados 2016',
      theme: ThemeData(
        scaffoldBackgroundColor: OnpeColors.background,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: OnpeColors.navbarBlue,
          leading: const Icon(Icons.how_to_vote, color: Colors.white),
          title: const Text(
            'Elecciones Presidenciales 2016',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: OnpeColors.yellowStrip,
                ),
                const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white60,
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: 'PRESIDENCIAL'),
                    Tab(text: 'ACTAS'),
                    Tab(text: 'PARTICIPACIÓN'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: TabBarView(
                children: [
                  PresidencialTab(),
                  ActasTab(),
                  ParticipacionTab(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: OnpeColors.footerDark,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Column(
                children: [
                  Text(
                    'CONTÁCTENOS',
                    style: TextStyle(color: OnpeColors.yellowStrip, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Jr. Washington 1894, Cercado de Lima',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Correo electrónico: informes@onpe.gob.pe',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Central Telefónica: 417-0630 / Lunes a Viernes 08:30 - 16:30',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}