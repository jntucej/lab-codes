void main() {
  // Variables and Data Types
  int number = 10;
  double decimal = 20.53;
  String message = "Hello, Dart!";
  bool isDartFun = true;

  print('Variable and Data Types:');
  print('Number: $number');
  print('Decimal: $decimal');
  print('Message: $message');
  print('Is Dart fun: $isDartFun\n');

  // If-Else
  if (number > 5) {
    print('The number $number is greater than 5!');
  } else {
    print('The number $number is not greater than 5!');
  }

  // Loop
  print('In loop: printing numbers from 1 to 5!');
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}
