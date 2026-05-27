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
      
      id: map['id'] as int? ?? 0,

    
      titulo: (map['titulo'] as String?)?.trim() ?? 'Sem título',
      responsavel: (map['responsavel'] as String?)?.trim() ?? 'Não informado',
      status: (map['status'] as String?)?.trim() ?? 'sem status',
      prioridade: (map['prioridade'] as String?)?.trim() ?? 'sem prioridade',

      
      valor: tratarValor(map['valor']),

    
      horas: int.tryParse(map['horas']?.toString() ?? '') ?? 0,
    );
}   
