import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/constants.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/waveclipper.dart';

class Soki extends StatefulWidget {
  const Soki({super.key});

  @override
  State<Soki> createState() => _SokiState();
}

class _SokiState extends State<Soki> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: WaveClipper1(),
        child: Container(
          color: red,
          height: screenHeight * 0.25,
        ),
        // ),
      ),
    );
  }
}
