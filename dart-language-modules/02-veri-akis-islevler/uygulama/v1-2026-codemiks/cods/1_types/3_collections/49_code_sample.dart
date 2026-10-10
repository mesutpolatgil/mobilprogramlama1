void main() {
  var items = [
    if (condition) oneThing(),
    if (condition) ...[multiple(), things()],
  ]; // [oneThing, [multiple_a, multiple_b], things]
  print(items);
}

const condition = true;
String oneThing() => 'oneThing';
List<String> multiple() => ['multiple_a', 'multiple_b'];
String things() => 'things';
