void main() {
  while (true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }
}

var requests = 0;
bool shutDownRequested() => requests >= 3;
void processIncomingRequests() => print('İstek işlendi: ${++requests}');
