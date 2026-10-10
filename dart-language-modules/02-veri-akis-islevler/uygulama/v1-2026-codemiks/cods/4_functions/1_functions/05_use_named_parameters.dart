void main() {
  enableFlags(bold: true, hidden: false);
}

/// [bold] ve [hidden] bayraklarını ayarlar ...
void enableFlags({bool? bold, bool? hidden}) {
  print('bold: $bold, hidden: $hidden');
}
