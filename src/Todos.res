type todo = {
  id: string,
  body: string,
  completed: bool
}

let fixedTodos: array<todo> = [
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
  let (todos, setTodos) = React.useState(_ => [])
  let (loading, setLoading) = React.useState(_ => false)

  let fetchData = () => {
    open Promise
    Promise.resolve(fixedTodos)
    ->then(res => {
      resolve(res)
    })
  }

  React.useEffect0(() => {
    setLoading(_ => true)
    open Promise
    fetchData()
    ->Promise.then(res => {
      setTodos(_ => res)
      setLoading(_ => false)
      resolve(res)
    })
    ->ignore
    None
  })

  let onChange = (e, id: string) => {
    let checked: bool = ReactEvent.Form.target(e)["checked"]
    let updatedTodos = Belt.Array.map(todos, todo => {
      if todo.id !== id {
        todo
      } else {
        {...todo, completed: checked}
      }
    })

    setTodos(_ => updatedTodos)
  }

  let todoList = Belt.Array.map(todos, todo => {
    <TodoItem key={todo.id} body={todo.body} completed={todo.completed} onChange={e => onChange(e, todo.id)} />
  })

  let loadingEl = <p>{React.string("Loading...")}</p>
  let todoEl =
    <>
      <h1>{React.string("Todos")}</h1>
      <div className="todo-list">
        {React.array(todoList)}
      </div>
    </>

  switch loading {
  | true => loadingEl
  | false => todoEl
  }
}