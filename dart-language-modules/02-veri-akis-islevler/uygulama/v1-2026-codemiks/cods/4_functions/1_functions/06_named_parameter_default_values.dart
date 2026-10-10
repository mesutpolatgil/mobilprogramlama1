/// [bold] ve [hidden] bayraklarını ayarlar ...
void enableFlags({bool bold = false, bool hidden = false}) {
  print('bold: $bold, hidden: $hidden');
}

void main() {
  // bold true olur; hidden false olur.
  enableFlags(bold: true);
}
