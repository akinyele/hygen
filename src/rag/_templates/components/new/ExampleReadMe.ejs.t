---
to: "<%= hasStorybook ? `${Name}/${Name}.mdx` : null %>"
---
<% if (hasStorybook && storybookVersion === '7') { -%>
import { ArgTypes, Canvas, Description, Meta } from "@storybook/blocks"

import * as <%= Name %>Stories from "./<%= Name %>.stories"

<Meta of={<%= Name %>Stories} />

# <%= Name %> Component

<Description of={<%= Name %>Stories.Primary} />
<ArgTypes of={<%= Name %>Stories.Primary} />
<Canvas of={<%= Name %>Stories.Primary} />
<% } else { -%>
import { Canvas, Meta, Story } from '@storybook/addon-docs'

import <%= Name %> from './<%= Name %>'

<Meta title="<%= Name %> Component" component={<%= Name %>} />

export const Template = args => <<%= Name %> {...args} />

# <%= Name %> Component

<Canvas>
  <Story name="Primary" args={(name = 'World')}>
    {Template.bind({})}
  </Story>
</Canvas>
<% } -%>

