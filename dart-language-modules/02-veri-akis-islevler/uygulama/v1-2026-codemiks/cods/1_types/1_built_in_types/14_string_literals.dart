// Bunlar const bir string içinde çalışır.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// Bunlar const bir string içinde ÇALIŞMAZ.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString';
// const invalidConstString = '$aNum $aBool $aString $aConstList';

void main() {
  print(aConstNum);
  print(aConstBool);
  print(aConstString);
  print(aNum);
  print(aBool);
  print(aString);
  print(aConstList);
  print(validConstString);
}
