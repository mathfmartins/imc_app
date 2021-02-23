import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('IMC'),
            centerTitle: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             Flexible(
               flex: 1,
               child: Container(
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Peso',
                        hintText: 'Peso em kg.'
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Container( // ou SizedBox
                      height: 10
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Altura',
                        hintText: 'Altura em metros.'
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                    ),
                     Container( //ou SizedBox
                      height: 10
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Calcular IMC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                        onPressed: () {
                          //função
                        },
                      ),
                    ),
                 ],),
               )
             ),
             Flexible(
               flex: 2,
               child: Center(child: Image.asset('assets/images/abaixo.png')),
             )
            ],
          )
        )
      );
  }

}