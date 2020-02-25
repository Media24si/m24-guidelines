# CSS Code style

## File structure

Use a components folder to store separate smaller parts of your styles.

```
  /resources
    /scss
      /components
        ...
```

Component names should be prefixed with an underscore `_`.

```
    /components
      _form.scss
      _notification.scss
      ...
```

## Imports

Import components without the underscore prefix.

```scss
@import './components/form';
@import './components/notification';
```

## Fonts

If you're including fonts from other external sites like GoogleFonts, always include them in the header instead of including them in the style file.

:thumbsup:

```html
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&display=swap&subset=latin-ext" rel="stylesheet">
```

:thumbsdown:

```scss
@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,500,600,700&subset=latin-ext');
```
