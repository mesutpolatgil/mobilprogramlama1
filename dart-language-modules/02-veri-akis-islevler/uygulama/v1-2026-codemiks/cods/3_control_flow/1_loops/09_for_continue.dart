void main() {
  for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }
}

class Candidate {
  Candidate(this.name, this.yearsExperience);
  final String name;
  final int yearsExperience;

  void interview() => print('$name ile mülakat yapılıyor.');
}

final candidates = [Candidate('Ayşe', 7), Candidate('Mert', 2), Candidate('Deniz', 5)];
