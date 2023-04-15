
const enToFaNumberMap = {
  '0': '۰',
  '1': '۱',
  '2': '۲',
  '3': '۳',
  '4': '۴',
  '5': '۵',
  '6': '۶',
  '7': '۷',
  '8': '۸',
  '9': '۹',
};

const faToEnNumberMap = {
  '۰': '0',
  '۱': '1',
  '۲': '2',
  '۳': '3',
  '۴': '4',
  '۵': '5',
  '۶': '6',
  '۷': '7',
  '۸': '8',
  '۹': '9',
};

String convertToFa(String str) {
  enToFaNumberMap.forEach((key, value) {
    str = str.replaceAll(key, value);
  });
  return str;
}

String convertToEn(String str) {
  faToEnNumberMap.forEach((key, value) {
    str = str.replaceAll(key, value);
  });
  return str;
}