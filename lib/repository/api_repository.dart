import 'package:cubit_formation/service/api_service.dart';

import '../models/post.dart';


class ApiRepository {

  final ApiService apiService;


  const ApiRepository({required this.apiService});

  Future<List<Post>> getPostList() async {
    final response = await apiService.getPostData();
    final data = response?.data as List<dynamic>;

      return data.map((singlePost) => Post.fromMap(singlePost)).toList();

  }

}