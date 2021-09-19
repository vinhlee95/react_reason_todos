%%raw(`import './App.css';`)

@react.component
let make = () => {
  <div className="App">
    <h1>{React.string("Todos")}</h1>
  </div>
}