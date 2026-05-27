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
//RF01 – Transformar mapas em objetos 
factory TarefaModel.fromMap(Map<String, dynamic> map) {
    double tratarValor(dynamic valorBruto) {
      if (valorBruto == null) return 0.0;//RF02 – Tratar campos nulos
      
      String texto = valorBruto.toString()
          .replaceAll('R\$', '') 
          .replaceAll('.', '')   
          .replaceAll(',', '.')   
          .trim();  //RF03 – Remover espaços desnecessários              
          
      return double.tryParse(texto) ?? 0.0;
    }
return TarefaModel(
      
      id: map['id'] as int? ?? 0,

    
      titulo: (map['titulo'] as String?)?.trim() ?? 'Sem título',
      responsavel: (map['responsavel'] as String?)?.trim() ?? 'Não informado',
      status: (map['status'] as String?)?.trim() ?? 'sem status',
      prioridade: (map['prioridade'] as String?)?.trim() ?? 'sem prioridade',

      
      valor: tratarValor(map['valor']),//RF04 – Converter valor monetário para número

    
      horas: int.tryParse(map['horas']?.toString() ?? '') ?? 0, //RF05 – Converter horas para número inteiro 
    );
}   
}