import 'package:http/http.dart' as http;

/// contains all service to get data from Server
class RestApiServices {
  static final RestApiServices _restApiServices = RestApiServices._internal();

  factory RestApiServices() {
    return _restApiServices;
  }
  RestApiServices._internal();

  // to get data from server, you can use Http for simple feature
  // or Dio for more complex feature

  // Example:
  // Future<ProductDetail?> getProductDetail(int id)async{
  //   var uri = Uri.parse(ApiPath.product + "/$id");
  //   try {
  //     return await Dio().getUri(uri);
  //   } on DioError catch (e) {
  //     print(e);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //tasks

//   final String _baseUrl = 'smiley-appi.herokuapp.com';
//   List<TaskCardData> tasks = [];
//   late TaskCardData selectedTask;
//   bool isLoading = true;
//   bool isSaving = false;
//   // late DBProvider _dbProvider;
//   TaskService() {
//     // _dbProvider = DBProvider();
//     loadTasks();
//   }

//   Future<List<TaskCardData>> loadTasks() async {
//     isLoading = true;
//     final url = Uri.https(_baseUrl, '/api/tasks');
//     final resp = await http.get(url);
//     final List<dynamic> tasksMap = jsonDecode(resp.body);
//     final jsonData = jsonDecode(resp.body);

//     for (var item in jsonData) {
//       // ignore: prefer_const_constructors
//       tasks.add(TaskCardData(
//         done: ["done"],
//         dueDay: ['dueDay'],
//         points: ['points'],
//         priority: ['priority'],
//         profilContributors: ['profilContributors'],
//         title: ['title'],
//         totalComments: ['totalComments'],
//         totalContributors: ['totalContributors'],
//         type: ['type'],
//         user: ['user'],
//         description: ['description'],
//         // item["title"],
//         // item["type"],
//         // item["priority"],
//         // item["description"],
//         // item["user"],
//         // item["points"],
//         // item["done"],
//         // item["dueDay"],
//         // item["profilContributors"],
//         // item["totalComments"],
//         // item["totalContributors"],
//         // item["id"]

//       //));

//       // _dbProvider.getTodasLasTasks();
//       // _dbProvider.nuevaTask(TaskModel(
//       //     id: item["id"],
//       //     title: item["title"],
//       //     description: item["description"]));
//       // _dbProvider.getTodasLasTasks();
//     }

//     isLoading = false;
//     // notifyListeners();
//     return tasks;
//   }

}
