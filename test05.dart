// 5) Escreva um programa que inverta os caracteres de um string.

// IMPORTANTE:
// a) Essa string pode ser informada através de qualquer entrada de sua preferência ou pode ser previamente definida no código;
// b) Evite usar funções prontas, como, por exemplo, reverse;

main() {
  String string = 'Bruno Amado';

  String reverseString(String string) {
    String temp = '';
    String newString = '';
    for (int index = string.length - 1; index >= 0; index--) {
      temp = string[index];
      newString = newString + temp;
    }
    return newString;
  }

  print(reverseString(string));
}
