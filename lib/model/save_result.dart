sealed class SaveResult {
  final String message;
  SaveResult(this.message);
}

class Success extends SaveResult {
  Success(super.message);
}

class Failure extends SaveResult {
  Failure(super.message);
}

class LoginRequired extends SaveResult {
  LoginRequired(super.message);
}

class MaxLimitReached extends SaveResult {
  MaxLimitReached(super.message);
}