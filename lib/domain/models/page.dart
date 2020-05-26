
class Page<T> {
  List<T> data;
  bool hasMore;
  int nextPage;
  Page({this.data, this.hasMore, this.nextPage});

  @override
  String toString() {
    return "Page[next: $nextPage, hasMore: $hasMore, data: $data]";
  }
}