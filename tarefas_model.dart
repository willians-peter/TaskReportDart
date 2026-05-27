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
    double tratarValor(dynamic valorBruto) {
      if (valorBruto == null) return 0.0;
      
      String texto = valorBruto.toString()
          .replaceAll('R\$', '') 
          .replaceAll('.', '')   
          .replaceAll(',', '.')   
          .trim();                
          
      return double.tryParse(texto) ?? 0.0;
    }
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
//ajustando para branch develop