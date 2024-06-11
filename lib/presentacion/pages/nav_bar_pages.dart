import 'package:flutter/material.dart';
import 'package:flutter_app/presentacion/pages/car_perfil.dart';
import 'package:flutter_app/presentacion/pages/crear_mantenimiento.dart';
import 'package:flutter_app/presentacion/pages/lista_mantenimiento.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBarPages extends StatefulWidget {
  const NavBarPages({super.key});

  @override
  _NavBarPagesState createState() => _NavBarPagesState();
}

class _NavBarPagesState extends State<NavBarPages> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    const SecondScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: _selectedIndex == 1 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) => CrearMantenimiento()));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ) : null,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color.fromARGB(255, 50, 50, 50),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
            child: GNav(
              rippleColor: const Color.fromARGB(255, 42, 42, 42),
              hoverColor: const Color.fromARGB(255, 90, 90, 90),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 60, 60, 60),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: LineIcons.car,
                  text: 'Automóvil',
                ),
                GButton(
                  icon: LineIcons.tools,
                  text: 'Mantenimientos',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}