class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.accountNumber, this.value);

  @override
  String toString() {
    return 'Transfer {\n  accountNumber: $accountNumber,\n  value: $value\n}}';
  }
}
