import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/TVs/presentation/controllers/tv_bloc.dart';
import 'package:movies/TVs/presentation/controllers/tv_states.dart';
import 'package:movies/TVs/presentation/screens/tv_detail_screen.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:shimmer/shimmer.dart';

class PopularTvComponent extends StatelessWidget {
  const PopularTvComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc ,TvState>(
      //buildWhen: ((previous, current) => previous.popularMoviesState != current.popularMoviesState),
      builder: (context,state){
        switch (state.popularTvRequestState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularTv.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularTv[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>TvDetailScreen(id:index)));
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return Container(
              child: Center(child: Text(state.topRatedTvMessage)),
            );
        }
      },
    );
  }
}
