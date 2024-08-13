
import 'package:bloc/bloc.dart';
import 'package:cubit_formation/cubit/post_fetch_cubit_state.dart';
import 'package:cubit_formation/models/failure_model.dart';
import 'package:cubit_formation/models/post.dart';
import 'package:cubit_formation/repository/api_repository.dart';

class PostFetchCubitCubit extends Cubit<PostFetchCubitState> {


final ApiRepository apiRepository;

   PostFetchCubitCubit({required this.apiRepository}) : super(PostFechCubitInitial());
   Future<void> fetchPostApi() async {
    emit(PostFetcCubitLoading());
    try {
      final List<Post> postList = await apiRepository.getPostList();
      emit(PostFetchCubitLoaded(postList: postList));
    } on Failure catch(err){
      emit(PostFetchCubitFetchError(failure: err));
    }

    catch(err){
      print("erreur : $err");
    }

   }


}