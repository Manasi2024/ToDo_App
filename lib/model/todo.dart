class ToDo{

      String? id;
      String? todoText;
      bool isDone;


      ToDo({
        required this.id,
        required this.todoText,
        this.isDone= false,
      });

      static List<ToDo> todoList(){
          return [
            ToDo(id: '01', todoText: 'Morning Yoga ', isDone: true),
            ToDo(id: '02', todoText: 'Checking Mails ', isDone: true),
            ToDo(id: '03', todoText: 'Team Meeting',  ),
            ToDo(id: '04', todoText: 'Assignments ',  ),
            ToDo(id: '05', todoText: 'Medical Treatment', ),
            ToDo(id: '06', todoText: 'Project Work ', ),
            ToDo(id: '07', todoText: 'Shopping ', ),
            ToDo(id: '08', todoText:  'Room Cleaning ', ),
            ToDo(id: '09', todoText: ' Problem Solving  ', ),
          ];

      }
}