type todo = {
  id: string,
  body: string,
  completed: bool
}

let todos: array<todo> = [
  {
    id: "1",
    body: "Go to school",
    completed: false
  },
  {
    id: "2",
    body: "Go to the gym",
    completed: true
  }
]

@react.component
let make = () => {
  let todoList = Belt.Array.map(todos, todo => {
    <TodoItem key={todo.id} body={todo.body} completed={todo.completed}></TodoItem>
  })

  <div className="todos_list">
    <h1>{React.string("Todos")}</h1>
    {React.array(todoList)}
  </div>
}