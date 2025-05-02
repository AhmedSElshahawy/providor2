class Task {
  String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});

  void isDone() {
    isCompleted = !isCompleted;
  }
}
hujjbib