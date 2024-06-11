import 'package:flutter/material.dart';
import 'package:flutter_app/presentacion/pages/nav_bar_pages.dart';
import 'package:flutter_app/presentacion/widgets/input_decoration.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearMantenimiento extends StatefulWidget {
  CrearMantenimiento({super.key});

  @override
  State<CrearMantenimiento> createState() => _CrearMantenimientoState();
}

class _CrearMantenimientoState extends State<CrearMantenimiento> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController concepto = TextEditingController();
  DateTime selectedDate = DateTime(2024, 6, 13);
  TimeOfDay selectedTime = const TimeOfDay(hour: 9, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) => const NavBarPages()));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            'Crear',
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
                MaterialButton(
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 85, 85, 85),
                              Color.fromARGB(255, 40, 40, 40),
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Fecha: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100)
                      );
                      if (dateTime != null) {
                        setState(() {
                          selectedDate = dateTime;
                        });
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 85, 85, 85),
                              Color.fromARGB(255, 40, 40, 40),
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Hora: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${selectedTime.hour}:${selectedTime.minute}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial);
                      if (timeOfDay != null) {
                        setState(() {
                          selectedTime = timeOfDay;
                        });
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      autocorrect: false,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: 'Concepto',
                        labelText: 'Descripción',
                      ),
                      onChanged: (value) => value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese el concepto del mantenimiento';
                        }
                        return null;
                      },
                      controller: concepto,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 85, 85, 85),
                              Color.fromARGB(255, 40, 40, 40),
                            ]),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (loginKey.currentState!.validate()) {
                        // await login(concepto.text, context);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
