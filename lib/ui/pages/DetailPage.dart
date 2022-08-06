import 'package:flutter/material.dart';
import 'package:trabalho_pos_fluter/models/teams.dart';


class DetailPage extends StatelessWidget {
  final Teams teams;

  DetailPage(this.teams);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.teams.name),
      ),
      body: Center(
          child: Column(children: <Widget>[
            const Text(
              'Bandeira',
              style: TextStyle(fontSize: 25),
            ),
            Image.network(
                'http://controle.mdvsistemas.com.br' + this.teams.flag.replaceFirst('~', '')),
          ])),
    );
  }


}
