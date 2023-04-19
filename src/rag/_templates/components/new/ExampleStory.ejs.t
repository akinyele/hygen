---
to: "<%= hasStorybook ? `${Name}/${name}.stories.tsx` : null %>"
---

<% if (storybookVersion === '7') { -%>
import React from "react";
import { Meta, StoryObj } from "@storybook/react";

import <%= Name %> from "./<%= Name %>";

type Story = StoryObj<typeof <%= Name %>>;

const meta: Meta<typeof <%= Name %>> = {
  component: <%= Name %>,
  title: "Components/<%= Name %>"
}

export default meta

export const Primary: Story = {
  args: {
    name: 'World'
  },
  render: (args) => <<%= Name %> name={args.name} />,
}
<% } else { -%>
import React from "react";
import { ComponentMeta, ComponentStory } from "@storybook/react";

import <%= Name %> from "./<%= Name %>";

export default  {
  title: '<%= Name %>',
  component: <%= Name %>,
} as ComponentMeta<typeof <%= Name %>>

const Template: ComponentStory<typeof <%= Name %>> = (args) => <<%= Name %> {...args}/>

export const Primary = Template.bind({});
Primary.args = {
  name: "World"
}
<% } -%>
