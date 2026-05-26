import 'dadosTarefas.dart';
class TarefaModel { 
int id; 
String titulo; 
String responsavel; 
String status; 
String prioridade; 
double valor; 
int horas; 
TarefaModel({ 
required this.id, 
required this.titulo, 
required this.responsavel, 
required this.status, 
required this.prioridade, 
required this.valor, 
required this.horas
}); 

factory TarefaModel.fromMap(Map<String, dynamic> map) 
return TarefaModel(
id: map['id'] as int,
titulo: map['titulo'] as String,
responsavel: map['responsavel'] as String,
status: map['status'] as String,
prioridade: map['prioridade'] as String,
valor: map['valor'] as double,
horas: map['horas'] as int,
);
}   
