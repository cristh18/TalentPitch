import 'package:flutter/material.dart';
import '../../../../domain/models/pitch_model.dart';

class PicthItem extends StatelessWidget {
  const PicthItem({
    Key? key,
    required this.pitch,
    required this.onPitchSelected,
  }) : super(key: key);

  final PitchModel pitch;
  final Function(PitchModel) onPitchSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPitchSelected(pitch),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                pitch.avatar,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pitch.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  pitch.desiredRole,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
