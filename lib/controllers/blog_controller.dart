import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../models/blog.dart';
import '../services/api_services.dart';
import '../utils/const.dart';
import '../widgets/loading_widget.dart';

class BlogController extends GetxController {
  final title = TextEditingController();
  final subTitle = TextEditingController();
  final dateCreated = DateTime.now().toIso8601String();
  final blogBody = TextEditingController();
final RxString blogId =''.obs;
final RxString search =''.obs;
  final searchController = TextEditingController();

  final blogKey = GlobalKey<FormState>();
  List<Blog> blogs = [];
  List<Blog> favoriteBlogs = [];


  createBlog(BuildContext context) async {
    try {
      showLoading(context);
      final Map<String, dynamic> variables = {
        'title': title.text,
        'subTitle': subTitle.text,
        'body': blogBody.text
      };
      final body = {
        'query': '''
   mutation createBlogPost(\$title: String!, \$subTitle: String!, \$body: String!) {
createBlog(title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost {
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}


        ''',
        'variables': variables,
      };
      final response = await http.post(
        ApiService.baseUrl,
        headers: ApiService.headers,
        body,
      );

      if (response.statusCode == 200) {
        defaultLogWriterCallback('Blog created: ${response.body}');
        Fluttertoast.showToast(
            msg: 'Blog created',
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 3);
        overlayEntry.remove();
        Get.back();
      } else {
        overlayEntry.remove();
        Fluttertoast.showToast(
            msg: 'Something went wrong',
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 3);

        defaultLogWriterCallback(
            'Error : ${response.statusCode} ${response.bodyString}');
        // return throw Exception('Une erreur est survenue, Veuillez réessayer');
      }
    } catch (e) {
      overlayEntry.remove();
      defaultLogWriterCallback('Erreur : $e', isError: true);
      return throw Exception('Une erreur est survenue, Veuillez réessayer');
    }
  }

  Future<List<Blog>> oneTimefetchBlogs() async {
    try {
      final body = {
        'query': '''
        query fetchAllBlogs {
  allBlogPosts {
    id
    title
    subTitle
    body
    dateCreated
  }
}
        ''',
      };

      final response = await http.post(
          ApiService.baseUrl, headers: ApiService.headers, body);

      if (response.statusCode == 200) {
        var data = json.decode(response.bodyString!);

        // defaultLogWriterCallback(response.bodyString!);
    blogs = data['data']['allBlogPosts']
            .map<Blog>((data) => Blog.fromJson(data))
            .toList();
   
   
      return blogs;
           
      } else {
        throw Exception('Une erreur est survenue, Veuillez réessayer');
      }
    } catch (e) {
      defaultLogWriterCallback('Erreur : $e', isError: true);
      throw Exception('Une erreur est survenue, Veuillez réessayer');
    }
  }


Future<List<Blog>> searchBlogs(String query) async {
    try {
      final body = {
        'query': '''
        query fetchAllBlogs {
  allBlogPosts {
    id
    title
    subTitle
    body
    dateCreated
  }
}
        ''',
      };

      final response = await http.post(
          ApiService.baseUrl, headers: ApiService.headers, body);

      if (response.statusCode == 200) {
        var data = json.decode(response.bodyString!);

        // defaultLogWriterCallback(response.bodyString!);
       blogs = data['data']['allBlogPosts']
            .map<Blog>((data) => Blog.fromJson(data))
            .toList();
   
      if(query.isNotEmpty) {
        return   blogs.where((blog)=>blog.title.contains(query)).toList();
      } else {
        return blogs;
      }
           
      } else {
        throw Exception('Une erreur est survenue, Veuillez réessayer');
      }
    } catch (e) {
      defaultLogWriterCallback('Erreur : $e', isError: true);
      throw Exception('Une erreur est survenue, Veuillez réessayer');
    }
  }

//   Stream<List<Blog>> fetchAllBlogs() async* {
//     try {
//       final body = {
//         'query': '''
//         query fetchAllBlogs {
//   allBlogPosts {
//     id
//     title
//     subTitle
//     body
//     dateCreated
//   }
// }
//         ''',
//       };

//       final response = await http.post(
//           ApiService.baseUrl, headers: ApiService.headers, body);

//       if (response.statusCode == 200) {
//         var data = json.decode(response.bodyString!);

//         // defaultLogWriterCallback(response.bodyString!);
//         blogs = data['data']['allBlogPosts']
//             .map<Blog>((data) => Blog.fromJson(data))
//             .toList();
//         update();
//         yield blogs;
//       } else {
//         throw Exception('Une erreur est survenue, Veuillez réessayer');
//       }
//     } catch (e) {
//       defaultLogWriterCallback('Erreur : $e', isError: true);
//       throw Exception('Une erreur est survenue, Veuillez réessayer');
//     }
//   }

  updateBlogPost(BuildContext context, ) async {
    try {
      showLoading(context);
      final Map<String, dynamic> variables = {
        'blogId': blogId.value,
        'title': title.text,
        'subTitle': subTitle.text,
        'body': blogBody.text
      };
      final body = {
        'query': '''
       mutation updateBlogPost(\$blogId: String!, \$title: String!, \$subTitle: String!, \$body: String!) {
  updateBlog(blogId: \$blogId, title: \$title, subTitle: \$subTitle, body: \$body) {
    success
    blogPost {
      id
      title
      subTitle
      body
      dateCreated
    }
  }
}

        ''',
        'variables': variables,
      };
      defaultLogWriterCallback(body.toString());

      final response = await http.post(
          ApiService.baseUrl, headers: ApiService.headers, body);

      if (response.statusCode == 200) {
        defaultLogWriterCallback(
            'Blog modifiée avec succes' ' : ${response.body}');
        Fluttertoast.showToast(
            msg: 'Blog updated',
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 3);
        overlayEntry.remove();
        Get.back();
      } else {
        overlayEntry.remove();
        Fluttertoast.showToast(
            msg: 'Une erreur est survenue',
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 3);

        defaultLogWriterCallback(
            'Erreur : ${response.statusCode} ${response.bodyString}');
        // return throw Exception('Une erreur est survenue, Veuillez réessayer');
      }
    } catch (e) {
      overlayEntry.remove();
      defaultLogWriterCallback('Erreur : $e', isError: true);
      return throw Exception('Une erreur est survenue, Veuillez réessayer');
    }
  }

  deleteBlogPost(BuildContext context, Blog blog) async {
    try {
      showLoading(context);
      final Map<String, dynamic> variables = {
        'blogId': blog.id,
      };
      final body = {
        'query': '''
       mutation deleteBlogPost(\$blogId: String!) {
  deleteBlog(blogId: \$blogId) {
    success
  }
}

        ''',
        'variables': variables,
      };

      final response = await http.post(
          ApiService.baseUrl, headers: ApiService.headers, body);

      if (response.statusCode == 200) {
        defaultLogWriterCallback('Blog delete  : ${response.body}');
     oneTimefetchBlogs();
     update();
        Fluttertoast.showToast(
            msg: 'Blog delete',
            backgroundColor: Colors.green,
            timeInSecForIosWeb: 3);
        overlayEntry.remove();
      } else {
        overlayEntry.remove();
        Fluttertoast.showToast(
            msg: 'Something went wrong',
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 3);

        defaultLogWriterCallback(
            'Erreur : ${response.statusCode} ${response.bodyString}');
        // return throw Exception('Une erreur est survenue, Veuillez réessayer');
      }
    } catch (e) {
      overlayEntry.remove();
      defaultLogWriterCallback('Erreur : $e', isError: true);
      return throw Exception('Une erreur est survenue, Veuillez réessayer');
    }
  }

  getInfo(Blog blog){
        title.text = blog.title;
        subTitle.text = blog.subTitle;
        blogBody.text = blog.body;
blogId.value = blog.id;

  }
}
