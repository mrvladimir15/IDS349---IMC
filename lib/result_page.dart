import 'package:flutter/material.dart';
import 'package:imc_calculator/constant.dart';

class ResultPage extends StatelessWidget {

  final double imcResult;
  ResultPage({required this.imcResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
      ),
      body: Center(
        child: Container(
          color: Color(0x1D1E33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your IMC result is'),
              Text(imcResult.toStringAsFixed(2), style: kHeightStyle,)
            ],
          ),
        ),
      ),
    );
  }
}