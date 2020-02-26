# JavaScript style guide

## Code Style

### Semicolons

No.

### Spacing and indentation

Indent 2 spaces.

Always use spaces, never tabs.

### Quotes

Use single quotes.

```js
this.$eventHub.$on('show-notify', this.addItem)
```

:thumbsdown:

```js
this.$eventHub.$on("show-notify", this.addItem)
```

Prefer string interpolation to string concatenation with the `+` operator

:thumbsup:

```js
const url = `https://www.youtube.com/watch?v=${this.id}?playlist=${this.playlistId}`
```

:thumbsdown:

```js
const url = 'https://www.youtube.com/watch?v=' + this.id + '?playlist=' + this.playlistId
```

### Variable assignment

Prefer `const` over `let`. Use `let` only if you reassign the variable. Never use `var`.

### Variable names

Write verbose and understandable variable names. Try not to abbreviate variables.

:thumbsup:

```js
const item = this.items.find(item => item.id === id)
```

:thumbsdown:

```js
const item = this.items.find(i => i.id === id)
```

### Comparisons

Always use **strict** equality (triple equals `===`) when comparing variables. Cast variables beforehand if you're unsure of their type.

:thumbsup:

```js
const resourceId = 1

axios.get('api-endpoint')
  .then(response => {
    /*
    response: {
      data: {
        resource_id: "1"
      }
    }
    */
    if (parseInt(response.data.resource_id, 10) === resourceId) {
      ...
    }
  })
```

:thumbsdown:

```js
const resourceId = 22

axios.get('api-endpoint')
  .then(response => {
    if (response.data.resource_id == resourceId) {
      ...
    }
  })
```

## Vue specific

### Vue templates

Use the linter to help formatting your vue files with the help of `eslint-plugin-vue`.

## Vue naming conventions

| Type            | Rule                      | Directory                     | Example  |
| --------------- |---------------------------|-------------------------------| ---------|
| Component       | PascalCase                | /components                   | *ImagePreview.vue*              |
| Mixin           | plural, kebab-case        | /mixins                       | *custom-templates.js*       |
| Directive       | singular, kebab-case      | /directives                   | *confirmation.js*                    |
| Script asset    | kebab-case                |                               | *storage.js*            |

## ESLint

The ESLint file is available [here](/eslintrc.json), if you for any reason need only this specific file.

<<< @/eslintrc.json