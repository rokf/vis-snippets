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
local snippets = require('snippets')

snippets:register("lua", {
	["fun"] = "function () end"
})
```

## License

This library is free software; you can redistribute it and/or modify it under the terms of the MIT license. See LICENSE for details.
