import 'package:covid/helpers/screen_navigation.dart';
import 'package:covid/helpers/style.dart';
import 'package:covid/screens/login.dart';
import 'package:covid/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';


class OnBoarding extends StatelessWidget {
  final pageList = [

    PageModel(
        color: white,
        heroAssetPath: 'images/social.png',
        title: Text('Cómo funciona?',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: primary,
              fontSize: 34.0,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Si uno de los usuarios de esta aplicación recibe una prueba de corona positiva, recuperaremos la lista de usuarios con los que ha estado en contacto durante los últimos 30 días.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: grey,
                fontSize: 18.0,
              )),
        ),
        iconAssetPath: 'images/circle.png'
    ),

    PageModel(
        color: white,
        heroAssetPath: 'images/q.png',
        title: Text('Close contact',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: primary,
              fontSize: 34.0,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Cada vez que tenga contacto cercano con otros usuarios, esos casos se almacenarán de forma segura en nuestra base de datos.!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: grey,
                fontSize: 18.0,
              )),
        ),
        iconAssetPath: 'images/circle.png'
    ),

    PageModel(
        color: white,
        heroAssetPath: 'images/mobile.png',
        title: Text('Privacy',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: primary,
              fontSize: 34.0,
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Su número de teléfono es el único detalle necesario para que pueda usar la aplicación Corona PY',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: grey,
                fontSize: 18.0,
              )),
        ),
        iconAssetPath: 'images/circle.png'
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FancyOnBoarding(
            doneButtonBackgroundColor: primary,
            doneButtonText: "Hecho",
            pageList: pageList,
            onDoneButtonPressed: () =>
                changeScreenReplacement(context, Login()),
            onSkipButtonPressed: () =>
                changeScreenReplacement(context, Login()),
          ),
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomText(text: "< swipe left", color: grey.withOpacity(0.5),)),)
        ],
      ),
    );
  }
}
