String? presentKey = 'Apple';
String? absentKey = null;

int? presentValue = 3;
int? absentValue = null;

var itemsA = {presentKey: absentValue}; // {Apple: null}
var itemsB = {presentKey: ?absentValue}; // {}

var itemsC = {absentKey: presentValue}; // {null: 3}
var itemsD = {?absentKey: presentValue}; // {}

var itemsE = {absentKey: absentValue}; // {null: null}
var itemsF = {?absentKey: ?absentValue}; // {}

void main() {
  print(presentKey);
  print(absentKey);
  print(presentValue);
  print(absentValue);
  print(itemsA);
  print(itemsB);
  print(itemsC);
  print(itemsD);
  print(itemsE);
  print(itemsF);
}
