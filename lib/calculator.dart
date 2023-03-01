import 'package:flutter/material.dart';
import 'package:flutter_imc/imc.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Imc imc = Imc(gender: Gender.female, height: 144, weight: 70);
  bool _genderState = true;
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.brown.shade50,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 6),
                          child: SizedBox(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(12)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: _genderState
                                    ? MaterialStateProperty.all(Colors.red)
                                    : MaterialStateProperty.all(Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.female,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Femme',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () => setState(() {
                                imc.gender = Gender.female;
                                _genderState = true;
                              }),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 6),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(12)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: _genderState
                                  ? MaterialStateProperty.all(Colors.black)
                                  : MaterialStateProperty.all(Colors.red),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.male,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Homme',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () => setState(() {
                              imc.gender = Gender.male;
                              _genderState = false;
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 25,
                    color: Colors.brown.shade50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Taille',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(
                                '${imc.height.toInt()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                        value: imc.height,
                        min: 100,
                        max: 220,
                        onChanged: (double value) =>
                            setState(() => imc.height = value),
                      ),
                    ],
                  ),
                  Divider(
                    height: 25,
                    color: Colors.brown.shade50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Poids',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(
                                '${imc.weight.toInt()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                        value: imc.weight,
                        min: 40,
                        max: 150,
                        onChanged: (double value) =>
                            setState(() => imc.weight = value),
                      ),
                    ],
                  ),
                  Divider(
                    height: 25,
                    color: Colors.brown.shade50,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _inputController,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Âge',
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                        focusColor: Colors.red,
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty || int.parse(value) <= 10) {
                          return "L'âge doit être supérieur à 10";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 500),
                    child: const Text(
                      'Pranked!',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'Calculer',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.check,
          color: Colors.black,
        ),
        backgroundColor: Colors.brown.shade50,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pushNamed('/results', arguments: imc);
          }
        },
      ),
    );
  }
}
