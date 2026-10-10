bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

void main() {
  print(isNoble(10));
  print(isNoble(11));
}

const _nobleGases = {2: 'He', 10: 'Ne', 18: 'Ar', 36: 'Kr', 54: 'Xe', 86: 'Rn'};
