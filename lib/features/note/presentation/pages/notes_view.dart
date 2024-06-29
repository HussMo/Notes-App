import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/note/presentation/bloc/note_bloc.dart';
import 'package:notes_app/features/note/presentation/bloc/note_event.dart';
import 'package:notes_app/features/note/presentation/bloc/note_state.dart';

// ignore: must_be_immutable
class NotesView extends StatelessWidget {
   NotesView({super.key });

   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notes')),
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter note',
                    ),
                    onFieldSubmitted: (value) {
                      BlocProvider.of<NoteBloc>(context).add(AddNoteEvent(note: value));
                      controller.clear();
                    },
                      
                  ),
            ),
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
              if (state is NoteInitial) {
                   return const Center(child: Text("No notes documented yet"));
              } else if (state is NoteLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NoteLoaded) {
                return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) => 
               ListTile(
              title: Card( 
              
                margin:  const EdgeInsets.all(10),
                color: Colors.amber,
              
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.notes[index]),
                )),
                
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<NoteBloc>(context).add(DeleteNoteEvent(index: index));
                },
              ),
            ),
            );

            
              
              }
              return Container();
            }),
          ),
        ],
      ),

    
    );
  }
}