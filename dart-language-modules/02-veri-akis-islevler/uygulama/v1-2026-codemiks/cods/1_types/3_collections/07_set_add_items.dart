void main() {
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements);
}

var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
