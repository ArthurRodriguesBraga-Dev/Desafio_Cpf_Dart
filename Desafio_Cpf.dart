import 'dart:io';

main() {
  String digitofinal1 = ""; //Variável para guardar o 1 digito final do CPF
  String digitofinal2 = ""; //Variável para guardar o 2 digito final do CPF
  int resultado = 0; //Resultado da 1º multiplicação dos valores do CPF
  int resultado2 = 0; //Resultado da 2º multiplicação dos valores do CPF
  print("Informe seu cpf: ");
  String cpftexto = stdin.readLineSync()!;

  cpftexto = cpftexto.replaceAll(".", "").replaceAll("-", "");
  digitofinal1 = cpftexto.substring(9, 10);
  digitofinal2 = cpftexto.substring(10, 11);
  cpftexto = cpftexto.substring(0, 9);

  List<String> cpf = [];
  for (int i = 0; i < 9; i++) {
    cpf.add(cpftexto.substring(i, i + 1));
  }

  for (int i = 0; i < cpf.length; i++) {
    int InteiroSepararCpf = int.parse(cpf[i]);
    resultado += InteiroSepararCpf * (i + 1);
  }

  int primeirodigitof = 0;   //Variável para o primeiro digito final
  primeirodigitof = resultado % 11;
  if (primeirodigitof == 10) {
    primeirodigitof = 0;
  }
  String primeirodigitoftexto = primeirodigitof.toString();
  cpf.add(primeirodigitoftexto);

  for (int i = 0; i < cpf.length; i++) {
    int InteiroSepararCpf = int.parse(cpf[i]);
    resultado2 += InteiroSepararCpf * (i);
  }
 

  int segundodigitof = 0;     //Variável para o segundo digito final
  segundodigitof = resultado2 % 11;
  if (segundodigitof == 10) {
    segundodigitof = 0;
  }
  String segundodigitoftexto = segundodigitof.toString();
  
  cpf.add(segundodigitoftexto);

  if (cpf[9] == digitofinal1 && cpf[10] == digitofinal2) {
    print("O CPF É VÁLIDO");
  } else {
    print("O CPF NÃO É VÁLIDO");
  }
}

