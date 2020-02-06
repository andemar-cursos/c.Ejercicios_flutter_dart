
//Metodo para verificar si un string, tiene valores numericos (Contando los double)
bool isNumeric(String valor){
  //Si es valor es empty retorna false
  if(valor.isEmpty) return false;
  //Se trata de pasar a number
  final res = num.tryParse(valor);
  //Si el valor es null, retorna false, si no, true.
  return (res == null) ? false : true;
}