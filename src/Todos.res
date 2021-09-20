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
    <div>
      <li key={todo.id}>
        {React.string(todo.body)}
      </li>
      <input type_="checkbox" checked={todo.completed} />
    </div>
  })

  <div className="todos_list">
    <h1>{React.string("Todos")}</h1>
    {React.array(todoList)}
  </div>
}