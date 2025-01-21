import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/app_theme.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_ubdate_delete_post_bloc/add_ubdate_delete_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts/get_refresh_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_page.dart';
import 'package:posts_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<GetRefreshPostsBloc>()..add(GetAllPostsEvent()),
        ),
        BlocProvider(
          create: (context) => di.sl<AddUbdateDeletePostBloc>(),
        ),
      ],
      child:  MaterialApp(
        theme: appTheme,
        home: PostsPage(),
      ),
    );
    
      
    
  }
}
