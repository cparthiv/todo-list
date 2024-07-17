import 'package:todo_list/todo_list.dart' as todo_list;

void main(List<String> arguments) {
  List<String> tasks = [];
  while (true) {
    todo_list.addTask(tasks);
    print("\x1B[2J\x1B[0;0H");
    todo_list.viewTasks(tasks);
  }
}
