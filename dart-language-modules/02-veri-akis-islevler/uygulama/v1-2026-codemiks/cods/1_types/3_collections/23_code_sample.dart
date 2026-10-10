int? absentValue = null;
int? presentValue = 3;
var items = [
  1,
  ?absentValue,
  ?presentValue,
  absentValue,
  5,
]; // [1, 3, null, 5]

void main() {
  print(absentValue);
  print(presentValue);
  print(items);
}
