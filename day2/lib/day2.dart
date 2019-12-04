List<int> computeNextState(List<int> inputState) {
  var currentOpCodePos = 0;

  while (true) {
    var opCode = inputState[currentOpCodePos];
    if (opCode == 99) {
      break;
    }

    var arg1Pos = inputState[currentOpCodePos + 1];
    var arg2Pos = inputState[currentOpCodePos + 2];
    var resultPos = inputState[currentOpCodePos + 3];

    switch (opCode) {
      case 1:
        inputState[resultPos] = inputState[arg1Pos] + inputState[arg2Pos];
        break;
      case 2:
        inputState[resultPos] = inputState[arg1Pos] * inputState[arg2Pos];
        break;
      default:
        break;
    }

    currentOpCodePos += 4;
  }

  return inputState;
}
