import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import  'package:calculadoraimc/CalculoIMC/cls_imc';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState>_formKey = GlobalKey();
  TextEditingController Controller_altura = TextEditingController();
  TextEditingController Controller_peso = TextEditingController();
  double _IMC = 0;
  String Infotxt ;
  String resultado="";
  void calc  (){
setState(() {

  Infotxt ="Informe seu dados";
  double a = double.parse(Controller_altura.text);
  double p = double.parse(Controller_peso.text);
  _IMC = cls_imc.calc_IMC(a, p);
if(Controller_altura.text.isEmpty || Controller_peso.text.isEmpty){

  Infotxt = "Dados em Branco !!! Informe seus dados";
}
else {
  if (_IMC < 18.5) {
    Infotxt = "Abaixo do peso";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
  if (_IMC >= 18.5 && _IMC <= 24.9) {
    Infotxt = "normal";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
  if (_IMC >= 25 && _IMC <= 29.9) {
    Infotxt = "Sobre Peso";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
  if (_IMC >= 30 && _IMC <= 34.9) {
    Infotxt = "Obesidade grau 1";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
  if (_IMC >= 35 && _IMC <= 39.9) {
    Infotxt = "Obesidade grau 2";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
  if (_IMC >= 40) {
    Infotxt = "Obesidade grau 3";
    resultado = "resultaddo do seu IMC : ${_IMC} , ${Infotxt}";
  }
}
});

  }
  void Reset() {
    setState(() {
      Controller_altura.text = "";
      Controller_peso.text = "";
      Infotxt ="Informe seu dados";
      resultado = "";
      _IMC =0;
    });

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de imc",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.blue,
            onPressed: Reset,
          )
        ],
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key:_formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 100,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(

                  controller: Controller_peso,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso em Kilograma",
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.6),
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira o  seu peso";
                    }

                  }


                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty)
                      // ignore: missing_return
                      return "Insira a sua altura";

                  },
                  controller: Controller_altura,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura em Centimetros",
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.6),

                ),
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      calc();
                    }
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.blue),
                  ),
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "${resultado}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

}
