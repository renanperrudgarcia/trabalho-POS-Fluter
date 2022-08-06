import 'package:flutter/material.dart';
import 'package:trabalho_pos_fluter/api/api.dart';
import 'package:trabalho_pos_fluter/models/teams.dart';
import 'package:trabalho_pos_fluter/ui/pages/DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Teams>? _teams = [];

  @override
  void initState() {
    super.initState();
    _get();
  }

  void _get() async {
    _teams = (await Api().getTeams()) ?? [];
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Times de Futebol'),
      ),
      body: Center(
        child: _teams == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: _teams!.length,
                itemBuilder: (context, index) {
                  var circleAvatar = CircleAvatar(
                      backgroundImage: NetworkImage(
                          "http://controle.mdvsistemas.com.br" +
                              _teams![index].flag.replaceFirst('~', '')));
                  return ListTile(
                    leading: circleAvatar,
                    title: Text(_teams![index].name),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(_teams![index])));
                    },
                  );
                },
              ),
      ),
    );
  }
}
