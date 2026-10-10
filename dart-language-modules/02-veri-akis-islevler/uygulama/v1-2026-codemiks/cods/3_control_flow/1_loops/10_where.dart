void main() {
  candidates
      .where((c) => c.yearsExperience >= 5)
      .forEach((c) => c.interview());
}

class Candidate {
  Candidate(this.name, this.yearsExperience);
  final String name;
  final int yearsExperience;

  void interview() => print('$name ile mülakat yapılıyor.');
}

final candidates = [Candidate('Ayşe', 7), Candidate('Mert', 2), Candidate('Deniz', 5)];
