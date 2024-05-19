import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/pitch_model.dart';
import '../../pitch_detail/ui/pitch_detail_view.dart';
import '../cubit/talent_category_detail_cubit.dart';
import 'items/pitch_item.dart';

class TalentCategoryDetailView extends StatelessWidget {
  const TalentCategoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pitches'),
      ),
      body: BlocBuilder<TalentCategoryDetailCubit, TalentCategoryDetailState>(
        builder: (BuildContext context, TalentCategoryDetailState state) {
          switch (state.status) {
            case TalentCategoryDetailStatus.loading:
              return _showLoaderWidget();
            case TalentCategoryDetailStatus.error:
              return _showErrorWidget(state);
            case TalentCategoryDetailStatus.success:
              return _showCategoryPitchesWidget(state);
          }
        },
      ),
    );
  }

  ListView _showCategoryPitchesWidget(TalentCategoryDetailState state) {
    return ListView.builder(
      itemCount: state.pitches.length,
      itemBuilder: (BuildContext context, int index) {
        return PicthItem(
          pitch: state.pitches[index],
          onPitchSelected: (PitchModel pitch) {
            _navigateToPicthDetailView(context, pitch);
          },
        );
      },
    );
  }

  Center _showErrorWidget(TalentCategoryDetailState state) {
    final String errorDescrition = state.errorDescrition;
    return Center(
      child: Text('Error: $errorDescrition'),
    );
  }

  Center _showLoaderWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToPicthDetailView(BuildContext context, PitchModel pitch) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => PitchDetailView(pitchModel: pitch),
      ),
    );
  }
}
