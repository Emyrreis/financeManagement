import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import 'accordion_view_model.dart';

class AccordionComponent extends StatelessWidget {
  final AccordionViewModel viewModel;

  const AccordionComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: viewModel.onTap, // Delegate: abrir/fechar é decidido por quem criou o ViewModel
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  viewModel.question,
                  style: const TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 16,
                    color: AppColors.lettersIcons,
                  ),
                ),
              ),
              AnimatedRotation(
                turns: viewModel.isExpanded ? 0.5 : 0, // gira a seta 180°
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.keyboard_arrow_down, size: 26),
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
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              viewModel.answer,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: AppColors.lettersIcons,
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