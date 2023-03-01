import 'dart:math';

enum Gender { male, female }

class Imc {
  Gender _gender;
  double _height;
  double _weight;

  Imc({required Gender gender, required double height, required double weight})
      : _gender = gender,
        _height = height,
        _weight = weight;

  Gender get gender => _gender;

  set gender(Gender value) {
    _gender = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  double get calc {
    double imcValue = _weight / pow(_height / 100, 2);

    return imcValue;
  }

  String get message {
    double imcValue = calc;
    String imcText = "Corpulance normale";

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

    return imcText;
  }
}
