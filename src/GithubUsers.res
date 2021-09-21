type myResponse = | Idle | Pending | Resolved | Rejected

type githubUser = {
  id: int,
  username: string,
  avatar_url: string,
  url: string
}

let githubUsersEndpoint = "https://api.github.com/users"

@react.component
let make = () => {
  let (status, setStatus) = React.useState(_ => Idle)
  let (users: array<githubUser>, setUsers) = React.useState(_ => [])

  let transformUser = (user): githubUser => {
    id: user["id"],
    avatar_url: user["avatar_url"],
    username: user["login"],
    url: user["url"],
  }

  // TODO: extract this to a custom hook
  React.useEffect0(() => {
      setStatus(_ => Pending)
      open Js.Promise
      Axios.get(githubUsersEndpoint)
      |> then_(response => {
        let transformedUsers = Belt.Array.map(response["data"], transformUser)
        setStatus(_ => Resolved)
        setUsers(_ => transformedUsers)
        resolve()
      })
      |> catch((error) => resolve(Js.log(error)))
      |> ignore
      None
    })

  let userItemEl = Belt.Array.map(users, user => {
    <div key={Belt.Int.toString(user.id)}>
      <p>{React.string(user.username)}</p>
    </div>
  })

  <>
    <h2>{React.string("GitHub users")}</h2>
    {switch status {
       | Idle => <></>
       | Pending => <p>{React.string("Loading...")}</p>
       | Resolved => <div>{React.array(userItemEl)}</div>
       | Rejected => <p>{React.string("Something went wrong")}</p>
       }}
  </>
}