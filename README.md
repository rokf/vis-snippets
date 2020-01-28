# vis-snippets

This is a plugin for [vis](https://github.com/martanne/vis) that adds an ability to replace ranges with pre-defined text (aka. snippets).

## Installation

On your typical Linux distribution you can do the following:

```sh
cd ~/.config/vis
git clone https://github.com/rokf/vis-snippets
```

Then `require` the plugin and configure snippets using its `register` method:

```lua
local snippets = require('vis-snippets/snippets')

assert(snippets:register("lua", {
	["fun"] = "function () end"
}))
```

## Snippet registration

Snippets are registered per syntax (language). Multiple separate registrations can happen per syntax. The `register` method is going to combine them.

The `register` method should be invoked as a method (`:`). Its first (second to self) para,eter is the syntax name (string). The second parameter is a table of key value pairs.

Keys should be strings that are to be replaced with their values (also strings).

## Usage

Select a range of text in the `VISUAL` mode. Run the `:snip` command. The text in the range should be replaced by the matching snippet, otherwise an error message will be written out into the info line.

The `:snip` command should correctly cooperate with other features of vis, that accept commands. For example `x/hello/ snip` should replace all hello instances with a snippet through the `snip` command - if a matching snippet exists.

Weird behavior should be reported through issues on GitHub.

## Possible improvements

- Improved multiline snippet insertions, where indentation is respected.
- Unit tests for non-vis functions/methods.

## License

This library is free software; you can redistribute it and/or modify it under the terms of the MIT license. See LICENSE for details.
