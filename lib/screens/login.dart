import 'package:covid/helpers/style.dart';
import 'package:covid/providers/auth.dart';
import 'package:covid/widgets/custom_button.dart';
import 'package:covid/widgets/custom_text.dart';
import 'package:covid/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: auth.loading ? CircularProgressIndicator() : SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/cell.png",
                  width: 160,
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomText(text: "Corona PY", size: 28, weight: FontWeight.bold),
            SizedBox(height: 5),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "Bienvenido a"),
              TextSpan(text: " Corona PY", style: TextStyle(color: Colors.blue.shade900)),
              TextSpan(text: " app"),
            ], style: TextStyle(color: black))),
            SizedBox(height: 10),
            CustomText(text: auth.errorMessage ?? "", color: red,),
            Padding(
              padding: const EdgeInsets.only(left:12, right: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: black, width: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.3),
                          offset: Offset(2, 1),
                          blurRadius: 2
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone_android, color: grey),
                        border: InputBorder.none,
                        hintText: "+595 999 123 123",
                        hintStyle: TextStyle(
                            color: grey,
                            fontFamily: "Sen",
                            fontSize: 18
                        )
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Después de ingresar su número de teléfono, haga clic en verificar para autenticarse. Luego espere hasta 20 segundos para obtener el CODIGO y continúe", textAlign: TextAlign.center, style: TextStyle(color: grey),),
            ),
            SizedBox(height: 10),
            CustomButton(msg: "Verificar", onTap: (){
              auth.verifyPhone(context, number.text);
            })
          ]),
        ),
      ),
    );
  }
}
