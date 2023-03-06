// 2) Dado a sequência de Fibonacci, onde se inicia por 0 e 1 e o próximo valor sempre será a soma dos 2 valores anteriores (exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...),
//escreva um programa na linguagem que desejar onde, informado um número, ele calcule
//a sequência de Fibonacci e retorne uma mensagem avisando se o número informado pertence ou não a sequência

main() {
  // Eu poderia usar o método pronto do dart .contains, porém vou realizar uma busca utilizando o algoritimo de busca binária. Como o Fibonacci tem um potêncial de
  // ser um array muito grande (já que é uma sequência infinita), optei por utilizar o algoritimo de busca binária por ser mais eficiente que o de busca linear em arrays grandes e ordenados.
  // para manter os principios de Clean Code, cada método realiza apenas uma função.

  List<int> calcFibonacci(int informedNumber) {
    List<int> fibonacciArray = [0, 1];
    int maxNumber = informedNumber;
    for (int index = 1; fibonacciArray[index] < maxNumber; index++) {
      int newNumber = fibonacciArray[index - 1] + fibonacciArray[index];
      fibonacciArray.add(newNumber);
    }
    return fibonacciArray;
  }

  bool binarySearch(List<int> array, int number) {
    int low = 0;
    int high = array.length - 1;
    bool isNumberInArray = true;
    while (low <= high) {
      int mid = ((low + high) / 2)
          .floor(); // calcula o meio do array, o metodo .floor é usado para arredondar
      if (array[mid] == number) {
        return isNumberInArray;
      }
      if (array[mid] < number) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return !isNumberInArray;
  }

  String numberInFibonnaci(List<int> fibonacciArray, int informedNumber) {
    if (binarySearch(fibonacciArray, informedNumber)) {
      return 'O número informado pertence a sequência Fibonacci';
    } else
      return 'O número informado não pertence a sequência Fibonacci';
  }

  int informedNumber = 2584;
  print(numberInFibonnaci(calcFibonacci(informedNumber), informedNumber));
}
