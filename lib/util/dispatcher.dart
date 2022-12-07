// ignore: comment_references
/// Named wrapper for a dispatch function to uniquely identify the [Store]s dispatch for widgets like [Provider]
/// that use the type to identify data.
class Dispatcher {
  const Dispatcher(void Function(Object? action) dispatch) : _dispatch = dispatch;

  void call(Object? action) {
    _dispatch(action);
  }

  final void Function(Object? action) _dispatch;
}
