class ApiKeys {
  static const id = "id";
  static const title = "title";

  static const body = "body";
  static const casedhPosts = "CASHED_POSTS";
}

class EndPoints {
  static const baseURL = "https://jsonplaceholder.typicode.com/";
  static const posts = "posts/";
 static String  deletePoint(int postId) {
    return "posts/$postId";
  }
}
