import 'tarefas_view_model.dart';
import 'function.dart';

void main() {
  
  final viewModel = TarefasViewModel();
  imprimirLinhaDupla();
  print('=== GERENCIADOR DE TAREFAS ===');
  print('Buscando tarefas no sistema...');

  viewModel.carregarTarefas();
  
  print('\nTarefas Encontradas:');
  imprimirLinha();

  
  for (var tarefa in viewModel.tarefas) { //RF06 – Exibir todas as tarefas convertidas 
    print('ID:  ${tarefa.id}');
    print('Título:     ${tarefa.titulo}');
    print('Responsável:      ${tarefa.responsavel}');
    print('Status:     ${tarefa.status}');
    print('Prioridade:    ${tarefa.prioridade}');
    print('Valor:R\$  ${tarefa.valor}');
    print('Horas:  ${tarefa.horas}');
    imprimirLinha();
  }
}
