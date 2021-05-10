import 'package:flutter/material.dart';
import 'package:youtube/views/EmAlta.dart';
import 'package:youtube/views/Incricoes.dart';
import 'package:youtube/views/Inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      EmAlta(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        // Text(
        //   "YouTube",
        //   style: TextStyle(color: Colors.black),
        // ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () => {print("acao: videocam")}),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {print("acao: pesquisa")}),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => {print("acao: conta")})
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                title: Text("Inicio"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Em Alta"), icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                title: Text("Inscrições"),
                icon: Icon(
                  Icons.subscriptions,
                )),
            BottomNavigationBarItem(
                title: Text("biblioteca"), icon: Icon(Icons.folder)),
          ]),
    );
  }
}
