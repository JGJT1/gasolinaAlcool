import 'package:flutter/material.dart';
import 'dart:math';
import 'components/Input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  String _resultado = '';

  void resolveQuadraticEquation(a, b, c){
    if (a == 0){
      setState(() {
        _resultado = 'Digite um valor para A';
      });
    }
    double delta = (pow(b, 2)-4*a*c).toDouble();
    switch (delta){
      case < 0:
        setState(() {
          _resultado = 'Não há raízes em números reais';
        });
      case == 0:
        double x = -b/(2*a);
        setState(() {
          _resultado = 'A raiz dessa equação é $x';
        });
      default:
        double x1 = (-b+pow(delta, 1/2))/(2*a);
        double x2 = (-b-pow(delta, 1/2))/(2*a);
        setState(() {
          _resultado = 'As raízes dessa equação são ${x1.toStringAsFixed(2)} e ${x2.toStringAsFixed(2)}';
        });
    }
  }
  // Método para calcular o melhor preço
  void _calcular() {
    double? valorA = double.tryParse(_controllerA.text.replaceAll(',', '.'));
    double? valorB = double.tryParse(_controllerB.text.replaceAll(',', '.'));
    double? valorC = double.tryParse(_controllerC.text.replaceAll(',', '.'));

    if (valorA == null || valorB == null || valorC == null) {
      setState(() {
        _resultado = 'Digite um valor válido!';
      });
      return;
    }
    resolveQuadraticEquation(valorA, valorB, valorC);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de equações de 2° grau'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image(
                  image: AssetImage('assets/math.jfif'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Calcule as raízes de uma equação quadrática',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _controllerA,
                    labelText: 'A',
                    suffix: 'x²',
                  ),
                  const SizedBox(width: 10), // espaçamento entre os campos
                  CustomTextField(
                    controller: _controllerB,
                    labelText: 'B',
                    suffix: 'x',
                  ),
                  const SizedBox(width: 10),
                  CustomTextField(
                    controller: _controllerC,
                    labelText: 'C',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                  ),
                  onPressed: _calcular,
                  child: const Text('Calcular'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
