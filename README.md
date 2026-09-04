Finance Management — Sample App

Projeto acadêmico da disciplina Mobile 2, desenvolvido em Flutter/Dart dentro do Android Studio. O objetivo é construir uma Sample App: uma aplicação de referência que reúne, em telas separadas, todos os componentes de interface baseados em um Design System do Figma.

Design System de referência
O projeto usa como base o kit Finance Management Mobile App UI/UX Kit (Figma, Community), replicando cores, tipografia e componentes definidos na página Design System do arquivo.

Arquitetura
O projeto segue o padrão de projeto Factory, combinado com ViewModel e Delegate, para manter a criação e o comportamento dos componentes organizados e desacoplados da tela:

ViewModel → Factory → Component → Widget Flutter
ViewModel: guarda os dados e o estado de um componente (texto, estado habilitado/selecionado, etc). Não sabe desenhar nada na tela.
Factory: centraliza a decisão de qual widget construir a partir do ViewModel.
Component: o widget Flutter em si — o build() fica enxuto, sem lógica de negócio.
Delegate: ações como clique não são resolvidas dentro do componente; são repassadas (delegadas) para uma função fornecida por quem criou o ViewModel.

Toda classe base de ViewModel é abstrata — não pode ser instanciada diretamente, apenas estendida por um ViewModel concreto.
