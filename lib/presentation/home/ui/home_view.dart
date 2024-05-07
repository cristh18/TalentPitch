import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/talent_categories_model.dart';
import '../../talent_category_detail/ui/talent_category_detail_page.dart';
import '../cubit/home_cubit.dart';
import 'items/talent_category_item.dart';

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
              final List<TalentCategoriesModel> localPicthes = state.talentCategories;
              if (localPicthes.isEmpty) {
                return RefreshIndicator(
                  onRefresh: cubit.getTalentCategories,
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
                    talentCategories: localPicthes, cubit: cubit);
              }
            case HomeStatus.success:
              final List<TalentCategoriesModel> talentCategories = state.talentCategories;
              return _BuildAPODBodyWidget(talentCategories: talentCategories, cubit: cubit);
          }
        },
      ),
    );
  }
}

class _BuildAPODBodyWidget extends StatelessWidget {
  const _BuildAPODBodyWidget({
    required this.talentCategories,
    required this.cubit,
  });
  final List<TalentCategoriesModel> talentCategories;
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
              talentCategories: talentCategories,
              onRefresh: cubit.getTalentCategories,
            ),
          ),
        ],
      ),
    );
  }
}

class __BuildListWidget extends StatelessWidget {
  const __BuildListWidget({
    required this.talentCategories,
    required this.onRefresh,
  });
  final List<TalentCategoriesModel> talentCategories;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        itemCount: talentCategories.length,
        itemBuilder: (BuildContext context, int index) {
          final TalentCategoriesModel talentCategory = talentCategories[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      TalentCategoryDetailPage(talentCategoryUrl: talentCategory.url),
                ),
              );
            },
            child: TalentCategoryItem(
              title: talentCategory.title,
              imageUrl: talentCategory.image,
              type: talentCategory.type,
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
