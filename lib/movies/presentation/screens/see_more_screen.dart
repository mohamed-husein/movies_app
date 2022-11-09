import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_constants.dart';
import 'package:movies_app/movies/domain/entities/movies_entities.dart';

class SeeMore extends StatelessWidget {
  const SeeMore(
      {Key? key,
      required this.movies,
      required this.count,
      this.isPopular = false})
      : super(key: key);
  final List<MoviesEntities> movies;
  final int count;
  final bool isPopular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0D14),
      appBar: AppBar(
        centerTitle: true,
        title: Text(isPopular == true ? 'Popular Movies' : 'Top Rated Movies'),
        backgroundColor: const Color(0xff36323c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 160,
                decoration: BoxDecoration(
                    color: const Color(0xff36323c),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    ApiConstants.imageUrl(
                                        movies[index].backdropPath),
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        height: 160,
                        width: MediaQuery.of(context).size.width-163,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            Text(
                              movies[index].title,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    movies[index].releaseDate.split('-')[0],
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12,),
                                const Icon(Icons.star,color: Colors.yellow,size: 20,),
                                const SizedBox(width: 3,),
                                Text(movies[index].voteAverage.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Text(movies[index].overview,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),maxLines: 2,
                            overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: count),
      ),
    );
  }
}
