import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final txtPesoCtrl = TextEditingController();

  final txtAlturaCtrl = TextEditingController();

  double imc = 0;
  String image = 'assets/images/ideal.png';

  double calculaIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  String obtemImagemPeloIMC(double imc) {
    if (imc < 17) {
      return 'assets/images/magreza.png';
    } else if (imc < 18.49) {
      return 'assets/images/abaixo.png';
    } else if (imc < 24.99) {
      return 'assets/images/ideal.png';
    } else if (imc < 29.99) {
      return 'assets/images/sobre.png';
    } else {
      return 'assets/images/obesidade.png';
    }
  }

  void onCalcularImcPressed() {
    double peso = double.parse(txtPesoCtrl.text);
    double altura = double.parse(txtAlturaCtrl.text);

    double imc = calculaIMC(peso, altura);
    String image = obtemImagemPeloIMC(imc);

    setState(() {
      this.imc = imc;
      this.image = image;
    });
  }

  // executei o setState(), ele executa novamente o método build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('IMC'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1, // 1/3
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Peso",
                      hintText: "Peso em kg.",
                    ),
                    keyboardType: TextInputType.number,
                    controller: txtPesoCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Altura",
                      hintText: "Altura em metros",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    controller: txtAlturaCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Calcular IMC",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: onCalcularImcPressed,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Seu IMC é de ${imc.toStringAsFixed(2)}"),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2, // 2/3
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}