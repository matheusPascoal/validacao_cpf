class CpfModel {
  final String value;

  CpfModel(this.value);

  /*
  */

  bool _verifyRepeatNumber() {
    final numberList = value.split('').map((e) => int.parse(e)).toList();
    return numberList.toSet().toList().length == 1;
  }

  String? validate() {
    if (value.isEmpty) {
      return 'Nao pode ser vazio';
    }
    if (int.tryParse(value) == null) {
      return 'Valor contém números repetidos';
    }

    if (_verifyRepeatNumber()) {
      return 'Não pode conter numeros repetidos';
    }

    if (value.length != 11) {
      return 'Valor nao pode ser menor que 11';
    }

    //   final frist = int.parse(value[9]);
    // final second = int.parse(value[10]);

    // if (frist != _getDigit(true)) {
    //   return 'Digito verificador 1 invalido';
    // }
    // if (second != _getDigit(true)) {
    //   return 'Digito verificador 2 invalido';
    // }

    return null;
  }

  int _getDigit(bool isFristDigit) {
    final numberList = value.split('').map((e) => int.parse(e)).toList();

    final nineFristNumbers = numberList.take(isFristDigit ? 9 : 10).toList();

    var result = 0;
    var i = 0;

    for (var count = isFristDigit ? 10 : 11; count >= 2; count--) {
      final mult = nineFristNumbers[i] * count;
      i++;
      result += mult;
    }
    var fristDigit = result % 11;
    fristDigit = result < 2 ? 0 : 11 - fristDigit;
    return fristDigit;
  }
}
