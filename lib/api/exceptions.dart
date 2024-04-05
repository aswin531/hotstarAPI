// ignore_for_file: avoid_print

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);
  void printMessage() {
    print('Bad request: $message');
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);
  void printMessage() {
    print('Unauthorized: $message');
  }
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
  void printMessage() {
    print('Forbidden: $message');
  }
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);
  void printMessage() {
    print('Not found: $message');
  }
}

class InternalServerErrorException implements Exception {
  final String message;
  InternalServerErrorException(this.message);
  void printMessage() {
    print('InternalServer: $message');
  }
}
