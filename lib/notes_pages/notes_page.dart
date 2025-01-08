import 'package:dsw53518/db/notes_database.dart';
import 'package:dsw53518/model/note.dart';
import 'package:dsw53518/notes_pages/edit_note.dart';
import 'package:dsw53518/notes_pages/note_detail.dart';
import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/views/login/login_view.dart';
import 'package:dsw53518/widgets/note_cart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future<void> refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  // @override
  // void dispose() {
  //   NotesDatabase.instance.close();
  //   super.dispose();
  // }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    await Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: AppBar(
          backgroundColor: MyColors.lightPurpleColor,
          title: Text(
            'Notes',
            style: TextStyle(fontSize: 24, color: MyColors.whiteColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.logout),
            color: MyColors.whiteColor,
            onPressed: () => _logout(context),
          ),
          actions: [
            Icon(Icons.search, color: MyColors.whiteColor),
            const SizedBox(width: 12),
          ],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No Notes',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.lightPurpleColor,
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const AddEditNotePage(),
              ),
            );
            await refreshNotes();
          },
        ),
      );

  Widget buildNotes() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return GestureDetector(
          onTap: () async {
            if (note.id == null) return;

            await Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ),
            );
            await refreshNotes();
          },
          child: NoteCardWidget(note: note, index: index),
        );
      },
    );
  }
}
