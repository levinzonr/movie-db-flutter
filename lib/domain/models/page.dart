
class Page<T> {
  List<T> data;
  bool hasMore;
  int nextPage;
  Page({this.data, this.hasMore, this.nextPage});
}