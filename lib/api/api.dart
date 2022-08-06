import 'package:http/http.dart' as http;
import 'package:trabalho_pos_fluter/models/teams.dart';

class Api {
  Future<List<Teams>?> getTeams() async {
    try {
      var url = Uri.parse('http://controle.mdvsistemas.com.br/Esportes/Times/GetTime');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Teams> _teams = teamModelFromJson(response.body);
        return _teams;
      }
    } catch (e) {
      print(e);
    }
  }
}
