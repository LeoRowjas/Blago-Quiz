import 'package:flutter/material.dart';

abstract class AppColors {
  static const pastelYellow = Color.fromARGB(255, 239, 237, 168);
  static const sapphireColor = Color.fromARGB(255, 137, 196, 235);
  static const accentBlue = Color.fromARGB(255, 6, 29, 63);
  static const errorRed = Color.fromARGB(255, 240, 92, 92);

  static List<List<Color>> gradients = const [
    <Color>[
      Color.fromARGB(255, 238, 143, 213),
      Color.fromARGB(255, 57, 74, 206)
    ],
    <Color>[
      Color.fromARGB(255, 16, 112, 136),
      Color.fromARGB(255, 241, 211, 102)
    ],
    <Color>[
      Color.fromARGB(255, 219, 67, 82),
      Color.fromARGB(255, 255, 213, 146)
    ],
    <Color>[
      Color.fromARGB(255, 77, 128, 224),
      Color.fromARGB(255, 112, 233, 182)
    ],
    <Color>[
      Color.fromARGB(255, 108, 186, 214),
      Color.fromARGB(255, 224, 67, 88)
    ],
  ];
}
