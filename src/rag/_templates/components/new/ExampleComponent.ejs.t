---
to: <%= Name %>/<%= name %>.tsx
---
export interface <%= Name %>Props {
  /** The name of person to greet. */
  name: string
}

/** Renders a greeting to the specified person. **/
const <%= Name %>: React.FC<<%= Name %>Props> = ({ name }) => {
  return <div>Hello {name}</div>
}

export default <%= Name %>
