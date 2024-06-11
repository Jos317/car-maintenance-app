import 'package:flutter/material.dart';
import 'package:flutter_app/presentacion/widgets/info_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 400,
          child: ModelViewer(
            backgroundColor: Color.fromARGB(255, 66, 66, 66),
            src: 'assets/model/prueba.glb',
            autoRotate: true,
            disableZoom: false,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Text(
                'Audi A8',
                style: GoogleFonts.getFont(
                  'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoContainer(title: 'MPG', subtitle: '22 cty / 30 hwy', vector: 'assets/vectors/group_24_x2.svg'),
                  InfoContainer(title: 'MPG', subtitle: '22 cty / 30 hwy', vector: 'assets/vectors/group_25_x2.svg'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoContainer(title: 'MPG', subtitle: '22 cty / 30 hwy', vector: 'assets/vectors/group_24_x2.svg'),
                  InfoContainer(title: 'MPG', subtitle: '22 cty / 30 hwy', vector: 'assets/vectors/group_25_x2.svg'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}