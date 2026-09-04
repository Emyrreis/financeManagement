import 'package:flutter/material.dart';
import 'accordion_view_model.dart';

class AccordionComponent extends StatelessWidget {
  final AccordionViewModel viewModel;

  const AccordionComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: viewModel.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  viewModel.question,
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 16,
                    color: colors.onSurface,
                  ),
                ),
              ),
              AnimatedRotation(
                turns: viewModel.isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(Icons.keyboard_arrow_down, size: 26, color: colors.onSurface),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Container(
            margin: const EdgeInsets.only(top: 17),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              viewModel.answer,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: colors.onSurface,
              ),
            ),
          ),
          crossFadeState: viewModel.isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}