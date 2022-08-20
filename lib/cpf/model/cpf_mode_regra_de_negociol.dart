class CpfModel {
  final String value;

  CpfModel(this.value);

  int getDigit(bool isFristDigit) {
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

  /*
  */

  bool _verifyRepeatNumber() {
    final numberList = value.split('').map((e) => int.parse(e)).toList();
    return numberList.toSet().toList().length == 1;
  }

  bool validate() {
    if (int.tryParse(value) == null) {
      return false;
    }

    if (_verifyRepeatNumber()) {
      return false;
    }

    if (value.length != 11) {
      return false;
    }

    final frist = int.parse(value[9]);
    final second = int.parse(value[10]);

    return frist == getDigit(true) && second == getDigit(false);
  }
}
