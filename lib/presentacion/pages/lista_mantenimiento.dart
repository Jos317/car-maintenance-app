import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -40,
                      top: -210,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(175.5),
                          color: const Color(0xFF323335),
                          gradient: const LinearGradient(
                            begin: Alignment(-1.644, -2.456),
                            end: Alignment(0.681, 1.322),
                            colors: <Color>[
                              Color(0xFF4D4C58),
                              Color(0x00FFFFFF)
                            ],
                            stops: <double>[0, 1],
                          ),
                        ),
                        child: const SizedBox(
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          'Mantenimientos',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 48,
                            color: const Color(0xFFFDFDFD),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(175.5),
                        color: Colors.transparent,
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: 4, // Define el número de elementos
                  itemBuilder: (context, index) {
                    return const MantenimientoItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MantenimientoItem extends StatelessWidget {
  const MantenimientoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 57, 57, 57),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 35,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 100, 100, 100),
              border: Border.all(
                color: Colors.white,
                width: 1
              )
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fecha: 2024-06-06",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                      ),
                      Text(
                        "Hora: 09:30",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Estado: En mantenimiento",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "Sint excepteur deseruntpariatur eirehenderit occaecat eiusmod est et id.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      )
    );
  }
}