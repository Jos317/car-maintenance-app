import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/login_controller.dart';
import 'package:flutter_app/presentacion/widgets/input_decoration.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        right: -10,
                        top: -80,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(175.5),
                            color: const Color(0xFF323335),
                            gradient: const LinearGradient(
                              begin: Alignment(-1.644, -2.456),
                              end: Alignment(0.681, 1.322),
                              colors: <Color>[Color(0xFF4D4C58), Color(0x00FFFFFF)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: const SizedBox(
                            width: 350,
                            height: 350,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -90,
                        top: -80,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(175.5),
                            color: const Color(0xFF323335),
                            gradient: const LinearGradient(
                              begin: Alignment(-1.644, -2.456),
                              end: Alignment(0.681, 1.322),
                              colors: <Color>[Color(0xFF323335), Color(0xFF4D4C58)],
                              stops: <double>[0, 1],
                            ),
                          ),
                          child: const SizedBox(
                            width: 350,
                            height: 350,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: Text(
                          'Bienvenido',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 48,
                            color: const Color(0xFFFDFDFD),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(175.5),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Sign in',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 45,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    autocorrect: false,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: 'Email',
                      labelText: 'Correo electrónico',
                    ),
                    onChanged: (value) => value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingrese el correo del usuario';
                      }
                      return null;
                    },
                    controller: email,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: 'Password',
                      labelText: 'Contraseña',
                    ),
                    onChanged: (value) => value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingrese la contraseña';
                      }
                      return null;
                    },
                    controller: password
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Olvidaste tu contraseña?',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: const Color(0xFFFFFFFF),
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
                        ]
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (loginKey.currentState!.validate()) {
                      await login(email.text, password.text, context);
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}