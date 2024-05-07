import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/pitch_model.dart';
import '../../pitch_category/ui/pitch_category_page.dart';
import '../cubit/home_cubit.dart';
import 'items/category_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF000B49),
            child: Center(
              child: Text(
                'Explore',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          final HomeCubit cubit = context.read<HomeCubit>();
          switch (state.status) {
            case HomeStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeStatus.error:
              final List<PitchModel> localPicthes = state.pitches;
              if (localPicthes.isEmpty) {
                return RefreshIndicator(
                  onRefresh: cubit.getTalentPitches,
                  child: ListView(
                    children: const <Widget>[
                      Center(
                        child: Text('Error'),
                      ),
                    ],
                  ),
                );
              } else {
                return _BuildAPODBodyWidget(
                    pitches: localPicthes, cubit: cubit);
              }
            case HomeStatus.success:
              final List<PitchModel> pitches = state.pitches;
              return _BuildAPODBodyWidget(pitches: pitches, cubit: cubit);
          }
        },
      ),
    );
  }
}

class _BuildAPODBodyWidget extends StatelessWidget {
  const _BuildAPODBodyWidget({
    required this.pitches,
    required this.cubit,
  });
  final List<PitchModel> pitches;
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 150,
        bottom: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Featured Pictures',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: __BuildListWidget(
              pitches: pitches,
              onRefresh: cubit.getTalentPitches,
            ),
          ),
        ],
      ),
    );
  }
}

class __BuildListWidget extends StatelessWidget {
  const __BuildListWidget({
    required this.pitches,
    required this.onRefresh,
  });
  final List<PitchModel> pitches;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        itemCount: pitches.length,
        itemBuilder: (BuildContext context, int index) {
          final PitchModel pitch = pitches[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      PitchCategoryPage(categoryVideosUrl: pitch.url),
                ),
              );
            },
            child: CategoryItem(
              title: pitch.title,
              imageUrl: pitch.image,
              type: pitch.type,
            ),
          );
        },
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;
    final Path path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
