/// 크기 한도가 정해져 있고, 이후 오래된 데이터 부터 삭제하는 Stack
class SizedStack<T> {
  final int _limit;
  final List<T> _list = [];

  /// 생성자
  /// [limit] 스택의 크기 한도
  SizedStack(this._limit) : assert(_limit > 0, "크기 한도는 자연수여야 합니다.");

  /// 스택이 비어있는 지
  bool get isEmpty => _list.isEmpty;

  /// 스택이 비어있지 않은 지
  bool get isNotEmpty => _list.isNotEmpty;

  /// 스택의 크기
  int get size => _list.length;

  /// 스택의 크기 한도
  int get limit => _limit;

  /// 스택이 꽉 찼는 지
  bool get isFull => size == limit;

  /// 스택의 최상위 요소 (비어 있으면 null)
  T? get top => isNotEmpty ? _list.last : null;

  /// 스택에서 값 삭제
  T? pop() {
    if (isNotEmpty) {
      final result = top;
      _list.removeLast();
      return result;
    }
    return null;
  }

  /// 스택에 값 추가
  void add(T data) {
    if (isFull) {
      _list.removeAt(0);
    }
    _list.add(data);
  }

  /// 스택 비우기
  void clear() {
    _list.clear();
  }
}
