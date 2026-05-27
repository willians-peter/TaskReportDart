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
  //RF07 – Filtrar tarefas por status 
  print('\n=== TAREFAS AGRUPADAS POR STATUS ===');
  imprimirLinhaDupla();
  final todosOsStatus = viewModel.tarefas.map((t) => t.status.toLowerCase().trim()).toSet();
  for (var statusAtual in todosOsStatus) {
    final tarefasDoStatus = viewModel.tarefas
        .where((t) => t.status.toLowerCase().trim() == statusAtual)
        .toList();
    String nomeGrupo = statusAtual[0].toUpperCase() + statusAtual.substring(1);
    print('\n STATUS: $nomeGrupo (${tarefasDoStatus.length} tarefa(s))');
    imprimirLinha();
    for (var tarefa in tarefasDoStatus) {
      print('   [ID ${tarefa.id}] ${tarefa.titulo}');
      print('    Responsável: ${tarefa.responsavel} | Prioridade: ${tarefa.prioridade}');
      print('    Tempo: ${tarefa.horas}h | Custo: R\$ ${tarefa.valor}');
      imprimirLinha();
    }
  }
    imprimirLinhaDupla();

  //RF08 – Somar valores das tarefas concluídas 
  print('\n=== TOTALIZAÇÃO FINANCEIRA ===');
  imprimirLinha();


  final totalConcluido = viewModel.tarefas
      .where((t) => t.status.toLowerCase().trim() == 'concluida')
      .fold<double>(0.0, (soma, tarefa) => soma + tarefa.valor);

  print('Total de tarefas concluídas: R\$ ${totalConcluido.toStringAsFixed(2)}');
  imprimirLinhaDupla();
  
  print('\n=== MÉDIA DE VALOR DAS TAREFAS PENDENTES ===');
  imprimirLinha();

  final tarefasPendentes = viewModel.tarefas
      .where((t) => t.status.toLowerCase().trim() == 'pendente')
      .toList();

   if (tarefasPendentes.isEmpty) {
    print('Não existem tarefas pendentes para calcular média.');
    imprimirLinhaDupla();
  } else {
      double somaValoresPendentes = tarefasPendentes.fold<double>(
      0.0, 
      (soma, tarefa) => soma + tarefa.valor,
    );

    double mediaFiltrada = somaValoresPendentes / tarefasPendentes.length;

    print('Média de valor das tarefas pendentes: R\$ ${mediaFiltrada.toStringAsFixed(2)}');
    imprimirLinhaDupla();
  }
  //RF10 – Calcular total de horas por status 
  //RF11 – Identificar tarefas com dados incompletos 
  //RF12 – Exibir status únicos usando Set 
  //RF13 – Criar classe base e classe filha 
  //RF14 – Aplicar encapsulamento 
  //RF15 – Gerar relatório final 

}