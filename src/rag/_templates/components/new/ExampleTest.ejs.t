---
to: "<%= hasJest ? `${Name}/${name}.test.tsx` : null %>"
---
import { render, screen } from "@testing-library/react"

import <%= Name %> from "./<%= Name %>"

describe("Components/<%= Name %>", () => {
  it("renders greeting", () => {
    <% if (hasStorybook) { -%>
     render(Primary.render({name: "World"}, undefined))
    <% } else { -%>
     render(<<%= Name %> name="World"/>)
    <% } -%>

    expect(screen.getByText("Hello").innerText).toMatch('World')
  })
})
