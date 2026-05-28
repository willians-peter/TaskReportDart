import 'tarefas_repository.dart';
import 'tarefas_model.dart';
import 'dadosTarefas.dart';

class TarefasViewModel {
final repository = TarefasRepository(DadosTarefas());

   //RF14 – Aplicar encapsulamento _deixandoPrivado
   final List<TarefaModel> _tarefas = [];
  
  
  List<TarefaModel> get tarefas => _tarefas;

  
  int get quantidadeTotal => _tarefas.length;

  void carregarTarefas() {
    
    _tarefas.clear();
    
    
    final tarefasCarregadas = repository.getTarefas();
    _tarefas.addAll(tarefasCarregadas);
  }
}