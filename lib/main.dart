import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/note/presentation/bloc/note_bloc.dart';
import 'package:notes_app/features/note/presentation/pages/notes_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child:  MaterialApp(
        home: NotesView(),
      ),
    );
  }
}
