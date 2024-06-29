import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/note/presentation/bloc/note_event.dart';
import 'package:notes_app/features/note/presentation/bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final List <String> notes = [];
  NoteBloc() : super(NoteInitial()) {
    on<AddNoteEvent>((event, emit) {
      notes.add(event.note);
      emit(NoteLoaded(notes: notes));
    });

    on<DeleteNoteEvent>((event, emit) {
      notes.removeAt(event.index);
      emit(NoteLoaded(notes: notes));
    });
  }
}
