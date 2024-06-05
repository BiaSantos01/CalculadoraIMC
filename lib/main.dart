import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculator());
}

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variáveis para armazenar os valores dos operandos
  double _peso = 0;
  double _altura = 0;
  double _result = 0;
  String _classificacao = '';

  //calcular o imc
  void _calculoImc() {
    setState(() {
      if (_altura != 0) {
        _result = _peso / (_altura * _altura);
        _classificacao = _getClassificacao(_result);
      } else {
        _result = 0;
        _classificacao = '';
      }
    });
  }

  String _getClassificacao(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc < 24.9) {
      return 'Peso normal';
    } else if (imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc < 34.9) {
      return 'Obesidade Grau 1';
    } else if (imc < 39.9) {
      return ' Obesidade grau 2 (severa)';
    } else {
      return 'Obesidade grau 3 (mórbida)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Calculadora de IMC - Beatriz de Oliveira 2°C',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      )),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para o primeiro operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite seu peso'),
              onChanged: (value) {
                setState(() {
                  _peso = double.tryParse(value) ?? 0;
                });
              },
            ),

            SizedBox(height: 20.0),
            // Campo de entrada para o segundo operando
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Digite sua altura (coloque . para separar)'),
              onChanged: (value) {
                setState(() {
                  _altura = double.tryParse(value) ?? 0;
                });
              },
            ),

            // Botões para realizar as operações
            SizedBox(height: 2.0),
            ElevatedButton(
                onPressed: _calculoImc,
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),

            SizedBox(height: 2.0),
            // Exibição do resultado
            Text(
              'Sua IMC: ${_result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),

            Text(
              'Sua classificação: $_classificacao',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
