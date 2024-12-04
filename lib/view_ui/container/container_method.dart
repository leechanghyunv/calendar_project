
double calculateRate(double total) {
  // 총액이 0원일 경우
  if (total == 0) {
    return 1;
  }
  // 1천만원 이상인 경우
  if (total >= 10000000) {
    return -1;
  }
  // 100만원 이상 1천만원 미만인 경우
  if (total >= 1000000) {
    return -0.5;
  }
  return 0.25;
}