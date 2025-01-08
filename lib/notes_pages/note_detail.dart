import 'package:dsw53518/db/notes_database.dart';
import 'package:dsw53518/model/note.dart';
import 'package:dsw53518/notes_pages/edit_note.dart';
import 'package:dsw53518/utils/my_colors.dart';
import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    required this.noteId,
    super.key,
  });

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future<void> refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: MyColors.lightPurpleColor,
          actions: [
            // Function to edit the note
            IconButton(
              icon: Icon(Icons.edit_outlined, color: MyColors.whiteColor),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => AddEditNotePage(note: note),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Delete the note using the delete button
            deleteButton(),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: MyColors.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Text(
                    //   // DateFormat.yMMMd().format(note.time),
                    //   style: const TextStyle(color: Colors.white38),
                    // ),
                    const SizedBox(height: 8),
                    Text(
                      note.description,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
        icon: const Icon(Icons.edit_outlined),
        onPressed: () async {
          if (isLoading) return;

          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => AddEditNotePage(note: note),
            ),
          );

          await refreshNote();
        },
      );

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}
