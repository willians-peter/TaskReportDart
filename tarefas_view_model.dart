import 'tarefas_repository.dart';
import 'tarefas_model.dart';
import 'dadosTarefas.dart';

class TarefasViewModel {
  final repository = TarefasRepository(DadosTarefas());

  List<TarefaModel> tarefas = [];
  

  void carregarTarefas() {
    tarefas = repository.getTarefas();
  }
}