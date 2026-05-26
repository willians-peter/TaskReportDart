import 'tarefas_view_model.dart';

void main() {
  // A View só conhece a ViewModel!
  final viewModel = TarefasViewModel();

  print('=== GERENCIADOR DE TAREFAS ===');
  print('Buscando tarefas no sistema...');

  // Pedimos para a ViewModel processar a busca
  viewModel.carregarTarefas();

  print('\nTarefas Encontradas:');
  print('-----------------------------------');
  
  // Mostramos os dados limpos que estão na ViewModel
  for (var tarefa in viewModel.tarefas) {
    print('Título:     ${tarefa.titulo}');
    print('Responsável:      ${tarefa.responsavel}');
    print('Status:     ${tarefa.status}');
    print('Prioridade:    ${tarefa.prioridade}');
    print('Valor:  ${tarefa.valor}');
    print('Horas:  ${tarefa.horas}');
    print('-----------------------------------');
  }
}