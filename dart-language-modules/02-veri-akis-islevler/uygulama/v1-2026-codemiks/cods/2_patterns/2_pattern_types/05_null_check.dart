void main() {
  String? maybeString = 'nullable with base type String';
  switch (maybeString) {
    case var s?:
    // 's' burada null olamayan String tipindedir.
  }
}
