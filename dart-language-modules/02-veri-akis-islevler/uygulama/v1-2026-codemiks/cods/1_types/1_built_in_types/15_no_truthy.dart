void main() {
  // Boş string kontrolü.
  var fullName = '';
  assert(fullName.isEmpty);

  // Sıfır kontrolü.
  var hitPoints = 0;
  assert(hitPoints == 0);

  // null kontrolü.
  var unicorn = null;
  assert(unicorn == null);

  // NaN kontrolü.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);
}
