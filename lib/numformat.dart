import 'dart:collection';
import 'dart:math';
const List<String> _suffixes = const <String>['k', 'M', 'B', 'G','T', 'P', 'E'];

String formatn(num n) {
  if (n == null) n = 0.00;
  LinkedHashMap<String, int> stringToLength = new LinkedHashMap<String,int>();
  for (int x = 0; x < _suffixes.length; x++) {
    stringToLength[_suffixes[x]] = (x + 1) * 3;
  }
  int lengthOfDigits = n.truncate().toString().length;
  int highestInt;
  String lesuff;
  for (String x in stringToLength.keys) {
    if (lengthOfDigits > stringToLength[x]) {
      highestInt = pow(10, stringToLength[x]);
      lesuff = x;
    }
    else if (n < stringToLength[x]) break;
  }
  if (n < 1000) {
    return n.toStringAsFixed(2);
  }
  return ((n / highestInt).toStringAsFixed(2)) + lesuff;
}
