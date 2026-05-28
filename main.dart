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

  for (var tarefa in viewModel.tarefas) {
    //RF06 – Exibir todas as tarefas convertidas
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
  final todosOsStatus = viewModel.tarefas
      .map((t) => t.status.toLowerCase().trim())
      .toSet();
  for (var statusAtual in todosOsStatus) {
    final tarefasDoStatus = viewModel.tarefas
        .where((t) => t.status.toLowerCase().trim() == statusAtual)
        .toList();
    String nomeGrupo = statusAtual[0].toUpperCase() + statusAtual.substring(1);
    print('\n STATUS: $nomeGrupo (${tarefasDoStatus.length} tarefa(s))');
    imprimirLinha();
    for (var tarefa in tarefasDoStatus) {
      print('   [ID ${tarefa.id}] ${tarefa.titulo}');
      print(
        '    Responsável: ${tarefa.responsavel} | Prioridade: ${tarefa.prioridade}',
      );
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

  print(
    'Total de tarefas concluídas: R\$ ${totalConcluido.toStringAsFixed(2)}',
  );
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

    print(
      'Média de valor das tarefas pendentes: R\$ ${mediaFiltrada.toStringAsFixed(2)}',
    );
    imprimirLinhaDupla();
  }
  //RF10 – Calcular total de horas por status
  print('\n=== TOTAL DE HORAS POR STATUS ===');
  imprimirLinha();

  // lista de status únicos do RF07
  for (var statusAtual in todosOsStatus) {
    final tarefasDoStatus = viewModel.tarefas.where(
      (t) => t.status.toLowerCase().trim() == statusAtual,
    );

    final totalHorasStatus = tarefasDoStatus.fold<int>(
      0,
      (soma, tarefa) => soma + tarefa.horas,
    );

    String nomeGrupo = statusAtual[0].toUpperCase() + statusAtual.substring(1);

    print('Status: $nomeGrupo total de horas: ${totalHorasStatus}h');
  }
  imprimirLinhaDupla();

  //RF11 – Identificar tarefas com dados incompletos
  print('\n=== TAREFAS COM DADOS INCOMPLETOS ===');
  imprimirLinha();

  // Filtra as tarefas que possuem algum campo essencial em branco ou zerado
  final tarefasIncompletas = viewModel.tarefas.where((tarefa) {
    return tarefa.titulo.trim().isEmpty ||
        tarefa.responsavel.trim().isEmpty ||
        tarefa.status.trim().isEmpty ||
        tarefa.horas == 0 ||
        tarefa.valor == 0.0;
  }).toList();

  if (tarefasIncompletas.isEmpty) {
    print('Todas as tarefas estão com os dados  preenchidos!');
    imprimirLinhaDupla();
  } else {
    print(
      'Atenção! Foram encontradas ${tarefasIncompletas.length} tarefa(s) com dados faltantes:\n',
    );

    for (var tarefa in tarefasIncompletas) {
      List<String> camposFaltantes = [];

      if (tarefa.titulo.trim().isEmpty) camposFaltantes.add('Título');
      if (tarefa.responsavel.trim().isEmpty) camposFaltantes.add('Responsável');
      if (tarefa.status.trim().isEmpty) camposFaltantes.add('Status');
      if (tarefa.horas == 0) camposFaltantes.add('Horas (valor zero)');
      if (tarefa.valor == 0.0) camposFaltantes.add('Valor (valor zero)');

      print(
        '  [ID ${tarefa.id}] - Nome provisório: "${tarefa.titulo.isEmpty ? 'Sem Título' : tarefa.titulo}"',
      );
      print('  Campos pendentes: ${camposFaltantes.join(', ')}');
      imprimirLinha();
    }
    imprimirLinhaDupla();
  }
  //RF12 – Exibir status únicos usando Set
  print('\n=== LISTA DE STATUS ÚNICOS DISPONÍVEIS ===');
  imprimirLinha();

  final Set<String> statusUnicosSet = viewModel.tarefas
      .map<String>((t) => t.status.toLowerCase().trim())
      .toSet();

  if (statusUnicosSet.isEmpty) {
    print('Nenhum status encontrado no sistema.');
  } else {
    print(
      'Atualmente, o sistema possui ${statusUnicosSet.length} status diferentes:',
    );

    for (String status in statusUnicosSet) {
      String statusFormatado = status[0].toUpperCase() + status.substring(1);
      print('  • $statusFormatado');
    }
  }
  imprimirLinhaDupla();

  //RF15 – Gerar relatório final
}
