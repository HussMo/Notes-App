abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final String note;
  AddNoteEvent({required this.note});
}

class DeleteNoteEvent extends NoteEvent {
  final int index;
  DeleteNoteEvent({required this.index});
}
