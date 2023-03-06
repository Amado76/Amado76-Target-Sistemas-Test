// 3) Dado um vetor que guarda o valor de faturamento diário de uma distribuidora, faça um programa, na linguagem que desejar, que calcule e retorne:
// • O menor valor de faturamento ocorrido em um dia do mês;
// • O maior valor de faturamento ocorrido em um dia do mês;
// • Número de dias no mês em que o valor de faturamento diário foi superior à média mensal.

// IMPORTANTE:
// a) Usar o json ou xml disponível como fonte dos dados do faturamento mensal;
// b) Podem existir dias sem faturamento, como nos finais de semana e feriados. Estes dias devem ser ignorados no cálculo da média;

main() {
  List<Revenue> revenues = json
      .map((j) => Revenue.fromJson(j))
      .toList(); //Cria uma lista de objetivos Revune, contendo dia e faturamento.

  void lowestRevenue(List<Revenue> revenues) {
    double lowestRevenue = double
        .infinity; //Usei o recurso do dart de double.inifinity, para garantir que o primeiro faturamento maior do que zero fosse menor que a variavel inicializada.
    int day = 0;

    for (var revenue in revenues) {
      if (revenue.value! < lowestRevenue && revenue.value! > 0) {
        lowestRevenue = revenue.value!;
        day = revenue.day!;
      }
    }

    print('O menor faturamento foi $lowestRevenue, ocorrido no dia $day');
  }

  void biggestRevenue(List<Revenue> revenues) {
    double biggestRevenue = 0;
    int day = 0;

    for (var revenue in revenues) {
      if (revenue.value! > biggestRevenue) {
        biggestRevenue = revenue.value!;
        day = revenue.day!;
      }
    }

    print('O maior faturamento foi $biggestRevenue, ocorrido no dia $day');
  }

  double avarageRevenue(List<Revenue> revenues) {
    double totalRevenue = 0;
    int days = 0;
    revenues;
    for (var revenue in revenues) {
      if (revenue.value! > 0) {
        totalRevenue = totalRevenue + revenue.value!;
        days = days + 1;
        //Ignora dias em que o faturamento foi 0 para calcular a média.
      }
    }
    double avarageRevenue = totalRevenue / days;
    return avarageRevenue;
  }

  countDaysAboveAverageRevenue(List<Revenue> revenues) {
    int days = 0;
    revenues;
    double avarage = avarageRevenue(revenues);

    for (var revenue in revenues) {
      if (revenue.value! > avarage) {
        days = days + 1;
      }
    }

    print('O faturamento diário foi superior à media mensal em $days dias');
  }

  lowestRevenue(revenues);
  biggestRevenue(revenues);
  countDaysAboveAverageRevenue(revenues);
}

class Revenue {
  int? day;
  double? value;

  Revenue({this.day, this.value});

  Revenue.fromJson(Map<String, dynamic> json) {
    day = json['dia'];
    value = json['valor'];
  }
}

var json = [
  {"dia": 1, "valor": 22174.1664},
  {"dia": 2, "valor": 24537.6698},
  {"dia": 3, "valor": 26139.6134},
  {"dia": 4, "valor": 0.0},
  {"dia": 5, "valor": 0.0},
  {"dia": 6, "valor": 26742.6612},
  {"dia": 7, "valor": 0.0},
  {"dia": 8, "valor": 42889.2258},
  {"dia": 9, "valor": 46251.174},
  {"dia": 10, "valor": 11191.4722},
  {"dia": 11, "valor": 0.0},
  {"dia": 12, "valor": 0.0},
  {"dia": 13, "valor": 3847.4823},
  {"dia": 14, "valor": 373.7838},
  {"dia": 15, "valor": 2659.7563},
  {"dia": 16, "valor": 48924.2448},
  {"dia": 17, "valor": 18419.2614},
  {"dia": 18, "valor": 0.0},
  {"dia": 19, "valor": 0.0},
  {"dia": 20, "valor": 35240.1826},
  {"dia": 21, "valor": 43829.1667},
  {"dia": 22, "valor": 18235.6852},
  {"dia": 23, "valor": 4355.0662},
  {"dia": 24, "valor": 13327.1025},
  {"dia": 25, "valor": 0.0},
  {"dia": 26, "valor": 0.0},
  {"dia": 27, "valor": 25681.8318},
  {"dia": 28, "valor": 1718.1221},
  {"dia": 29, "valor": 13220.495},
  {"dia": 30, "valor": 8414.61}
];
