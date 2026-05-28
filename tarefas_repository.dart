import 'tarefas_model.dart';
import 'dadosTarefas.dart';

class TarefasRepository {
  final DadosTarefas _dadosTarefas;
  TarefasRepository(this._dadosTarefas);

  List<TarefaModel> getTarefas() {
    final List<Map<String, dynamic>> dadosBrutos = _dadosTarefas.getData();
    return dadosBrutos.map((mapa) => TarefaModel.fromMap(mapa)).toList();
  }
}
