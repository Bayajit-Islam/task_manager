class TaskModel {
   String title;
   String descripton;
  TaskModel({
  required this.title, 
  required this.descripton});

factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] ?? '',
      descripton: json['description'] ?? '',
    );
  }

}
