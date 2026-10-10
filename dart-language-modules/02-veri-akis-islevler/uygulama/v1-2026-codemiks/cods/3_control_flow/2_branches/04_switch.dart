void main() {
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      executeClosed();
    case 'PENDING':
      executePending();
    case 'APPROVED':
      executeApproved();
    case 'DENIED':
      executeDenied();
    case 'OPEN':
      executeOpen();
    default:
      executeUnknown();
  }
}

void executeClosed() => print('closed');
void executePending() => print('pending');
void executeApproved() => print('approved');
void executeDenied() => print('denied');
void executeOpen() => print('open');
void executeUnknown() => print('unknown');
