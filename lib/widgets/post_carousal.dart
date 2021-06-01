import 'package:flutter/material.dart';
import 'package:social_media_ui/models/post_model.dart';

class PostCarousal extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostCarousal({
    @required this.pageController,
    @required this.title,
    @required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            itemBuilder: (context, index) {
              Post post = posts[index];
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 400,
                        width: 300,
                        image: AssetImage(post.imageUrl),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.title),
                        Text(post.location),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text(post.likes.toString())
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.comment,
                                  color: Colors.blue,
                                ),
                                Text(post.comments.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            itemCount: posts.length,
            controller: pageController,
          ),
        )
      ],
    );
  }
}
