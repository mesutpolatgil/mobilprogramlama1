void main() {
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  assert(elements.length == 5);
  print(elements.length);
}

var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
