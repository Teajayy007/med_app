///[CustomException] class implements [Exception] for custom exception and messages.
class CustomException implements Exception {
  final String? _message;
  final String _prefix;

  CustomException(this._prefix, [this._message]);

  @override
  String toString() {
    return _message ?? _prefix;
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super('Error Occured During Communication:  ');
}

class EmptyDataException extends CustomException {
  EmptyDataException([String? message])
      : super('There are no list of events, click + icon to add new events:  ');
}
