@react.component
let make = (~body: string, ~completed: bool, ~onChange) => {
  <div className="todo-item">
    <p>{React.string(body)}</p>
    <input type_="checkbox" checked={completed} onChange={~onChange} />
  </div>
}