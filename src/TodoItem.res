@react.component
let make = (~body: string, ~completed: bool) => {
  <div>
    <p>{React.string(body)}</p>
    <input type_="checkbox" checked={completed} />
  </div>
}