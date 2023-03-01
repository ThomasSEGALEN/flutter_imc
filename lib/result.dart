import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_imc/imc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Imc imc = ModalRoute.of(context)!.settings.arguments as Imc;

    String imcText = "Corpulance normale";
    double imcValue = imc.weight / pow(imc.height / 100, 2);

    if (imcValue < 18.5) {
      imcText = "Insuffisance pondérale";
    } else if (imcValue >= 18.5 || imcValue < 25) {
      imcText = "Corpulence normale";
    } else if (imcValue >= 25 || imcValue < 30) {
      imcText = "Surpoids";
    } else if (imcValue >= 30 || imcValue < 35) {
      imcText = "Obésité modérée";
    } else if (imcValue >= 35 || imcValue < 40) {
      imcText = "Obésité sévère";
    } else if (imcValue >= 40) {
      imcText = "Obésité morbide ou massive";
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Results'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.brown.shade50,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              imc.gender == Gender.male ? 'Homme' : 'Femme',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.brown.shade50,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  imcText,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '${imcValue.round()}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.brown.shade50,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          '${imc.height.roundToDouble().toInt()}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.brown.shade50,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          '${imc.weight.roundToDouble().toInt()}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          'kg',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
