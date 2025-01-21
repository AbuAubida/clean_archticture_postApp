import 'package:dartz/dartz.dart';
import 'package:posts_app/core/errors/exceptions.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/core/network/network_state.dart';
import 'package:posts_app/features/posts/data/data_sources/local_data_source.dart';
import 'package:posts_app/features/posts/data/data_sources/remote_data_source.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

typedef CRUDTypeFunction = Future<Unit> Function();

class PostRepositoryImplementation implements PostsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  final NetworkStateImplementation isConnectedToInternet;
  PostRepositoryImplementation(
      {required this.isConnectedToInternet,
      required this.localDataSource,
      required this.remoteDataSource});
  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    // in this function we want to retrive all posts either from api or from local storage
    // first we must check the mopile connection to the internet
    // we will use the internet connection checker opject to do this
    if (await isConnectedToInternet.isConnected) {
      // the mopile is connected
      // then we check if the server is has no problems
      try {
        //get posts from api
        final remotePost = await remoteDataSource.getAllPosts();
       await localDataSource.cashePosts(remotePost);
        return Right(remotePost);
      } on ServerDataException {
        return Left(ServerFailure());
      }
    } else {
      // the mopile is not connected to the internet
      // we try to get the data from the local storage
      // we say try as the cashe may not has posts
      try {
        final lcoalPosts = await localDataSource.getCashedPosts();
        return Right(lcoalPosts);
      } on CasheDataException {
        // the cash or the local storage dosent hase any posts
        return Left(CasheDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(PostEntity post) async {
    // if (await isConnectedToInternet.isConnected) {
    //   try {
    //     // the function addPost need a post model if you post entity will cause errorr
    //     // as the post Mdel extends the post Entity not so you cant pass post entity to it
    //     // make type casting for it
    //     final requistedAddPost =
    //         PostModel(id: post.id, title: post.title, body: post.body);
    //     return Right(await remoteDataSource.addPost(requistedAddPost));
    //   } on ServerDataException {
    //     return Left(ServerFailure());
    //   }
    // } else {
    //   return Left(NoInternetConnectionFailure());
    // }
    // the function addPost need a post model if you post entity will cause errorr
    // as the post Mdel extends the post Entity not so you cant pass post entity to it
    // make type casting for it
    final requistedAddPost =
        PostModel(id: post.id, title: post.title, body: post.body);
    return addUbdatedDelete(() {
      return remoteDataSource.addPost(requistedAddPost);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return addUbdatedDelete(() {
      return remoteDataSource.deletePost(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> ubdatePost(PostEntity post) async {
    final requistedAddPost =
        PostModel(id: post.id, title: post.title, body: post.body);
    return addUbdatedDelete(() {
      return remoteDataSource.ubdatePost(requistedAddPost);
    });
  }

  Future<Either<Failure, Unit>> addUbdatedDelete(
      CRUDTypeFunction doThis) async {
    if (await isConnectedToInternet.isConnected) {
      try {
        doThis;
        return Right(unit);
        //  return Right(await remoteDataSource.addPost(requistedAddPost));
      } on ServerDataException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
