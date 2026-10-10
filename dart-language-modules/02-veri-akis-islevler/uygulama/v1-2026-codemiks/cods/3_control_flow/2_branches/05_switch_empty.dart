void main() {
  var command = 'OPEN';
  switch (command) {
    case 'OPEN':
      executeOpen();
      continue newCase; // newCase etiketinden çalışmaya devam eder.

    case 'DENIED': // Boş case bir sonrakine düşer (fall through).
    case 'CLOSED':
      executeClosed(); // Hem DENIED hem de CLOSED için çalışır,

    newCase:
    case 'PENDING':
      executeNowClosed(); // Hem OPEN hem de PENDING için çalışır.
  }
}

void executeOpen() => print('open');
void executeClosed() => print('closed');
void executeNowClosed() => print('now closed');
