import 'package:flutter/material.dart';

import '../../../domain/models/pitch_model.dart';
import 'pitch_detail_view.dart';

class PitchDetailPage extends StatelessWidget {
  const PitchDetailPage({super.key, required this.pitchModel});

  final PitchModel pitchModel;

  @override
  Widget build(BuildContext context) {
    return PitchDetailView(pitchModel: pitchModel);
  }
}
