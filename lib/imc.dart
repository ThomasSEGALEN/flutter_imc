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
}
