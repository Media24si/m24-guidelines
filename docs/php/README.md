# General PHP rules

## Code styles

First and foremost, be sure your code style follows [PSR-12](http://www.php-fig.org/psr/psr-12/).

## Comments

![Comments](./comments.jpg)

Mostly, keep from writing comments unless they are absolutely needed to explain some code functionality.

:thumbsup:

```php
class Article
{
    public function getSurnameAttribute()
    {
        $splitName = explode(' ', $this->name);
        return $splitName[count($splitName) - 1];
    }
}
```

:thumbsdown:

```php
class Article
{
    public function getSurnameAttribute(): string
    {
        // Split the name by the space character
        $splitName = explode(' ', $this->name);
        // Take the last element of the array and return it
        return $splitName[count($splitName) - 1];
    }
}
```

## Docblocks

Do not write dockblocks on methods if you can typehint them (unless you need a description).

:thumbsup:

```php
class Youtube
{
    public function getIdFromUrl(string $url): string
    {
        //
    }
}
```

:thumbsdown:

```php
class Youtube
{
    /**
     * Return the Youtube ID from a passed in URL
     *
     * @param string $url
     * @return string
     **/
    public function getIdFromUrl(string $url): string
    {

    }
}
```

## Strings

Prefer string interpolation to string concatenation with the `.` operator

:thumbsup:

```php
$url = "https://www.youtube.com/watch?v={$id}?playlist={$playlistId}";
```

:thumbsdown:

```php
$url = 'https://www.youtube.com/watch?v=' . $id . '?playlist=' . $playlistId;
```

If it is absolutely not possible to use interpolation, it is perfectly ok to use concatenation :ok_hand:.

## Ternary operators

TODO

## If statements

### Brackets

Always use curly brackets.

:thumbsup:

```php
if ($condition) {
    return $result;
}
```

:thumbsdown:

```php
if ($condition) return $result;
```

### Else

When possible try to avoid using `else`. Overly relying on using `if-else` can quickly lead to overly nested and unreadable code.


:thumbsup:

```php
if (empty($article)) {
    abort(404);
}

if (!$article->visible) {
    abort(404);
}

// ...
return $article;

```

:thumbsdown:

```php
if (!empty($article)) {
    if ($article->visible) {
        // ...
        return $article;
    } else {
        abort(404);
    }
} else {
    abort(404);
}
```

### Compound ifs

Prefer separate `if` statements over compound conditions.

:thumbsup:

```php
if (!$article->title) {
    // one condition logic
}

if (!$article->description) {
    // one condition logic
}

if (!$article->url) {
    // one condition logic
}
```

:thumbsdown:

```php
if (!$article->title || !$article->description || !$article->url ) {
    // logic for all 3 conditions
}
```

## Whitespace

Whitespaces should generally be added between statements. This makes for more readable and non-stuffy feeling code.

:thumbsup:

```php
public function index(Request $request)
{
    $request->validate([
        'resource'  => ['required', 'exists:resources,id', 'integer'],
        'query'     => ['required', 'string'],
        // ...
    ]);

    $articles = $this->getArticles($query);

    if (empty($articles)) {
        about(404);
    }

    return $articles;
}
```

:thumbsdown:

```php
public function index(Request $request)
{
    $request->validate([
        'resource'  => ['required', 'exists:resources,id', 'integer'],
        'query'     => ['required', 'string'],
    ]);
    $articles = $this->getArticles($query);
    if (empty($articles)) {
        about(404);
    }
    return $articles;
}
```

No extra lines between `{}` brackets. Unneeded and can lead to the code looking much bigger than it is.

:thumbsup:

```php
if ($article->hasTags()) {
    return $tags;
}
```

:thumbsdown:

```php
if ($article->hasTags()) {

    return $tags;

}
```

## Configs

Use kebab-case for configuration file names.

```
config/
    api-resource.php
```

Use snake_case for configuration keys.

```php
return [
    'docker_path' => env('DOCKER_PATH', null),
];
```

## Laravel specific

### Artisan commands

TODO

### Routing

TODO

### Controllers

TODO

## Views

Use kebab-case for view files.

:thumbsup:

```
    resources/
        views/
            simple-pagination.blade.php
```

## Validation

Always prefer using request validation helpers, unless you really have to use the validator instance.

:thumbsup:

```php
$request->validate([
    'client_id' => ['required', 'exists:clients,id'],
    'name'      => ['required', 'min:2', Rule::unique(Branch::class)->where('client_id', $request->input('client_id'))],
    'address'   => ['nullable', 'min:2'],
    'city'      => ['nullable', 'min:2'],
    'country'   => ['nullable', 'min:2'],
    'phone'     => ['nullable', 'min:2'],
    'email'     => ['nullable', 'min:2'],
]);
```

:thumbsdown:

```php
$validator = Validator::make($request->all(), [
    'client_id' => ['required', 'exists:clients,id'],
    'name'      => ['required', 'min:2', Rule::unique(Branch::class)->where('client_id', $request->input('client_id'))],
    'address'   => ['nullable', 'min:2'],
    'city'      => ['nullable', 'min:2'],
    'country'   => ['nullable', 'min:2'],
    'phone'     => ['nullable', 'min:2'],
    'email'     => ['nullable', 'min:2'],
]);

if ($validator->fails()) {
    //
}
```

```php
Validator::make($request->all(), [
    'client_id' => ['required', 'exists:clients,id'],
    'name'      => ['required', 'min:2', Rule::unique(Branch::class)->where('client_id', $request->input('client_id'))],
    'address'   => ['nullable', 'min:2'],
    'city'      => ['nullable', 'min:2'],
    'country'   => ['nullable', 'min:2'],
    'phone'     => ['nullable', 'min:2'],
    'email'     => ['nullable', 'min:2'],
])->validate();
```

Always use arrays when declaring validation rules. This prevents mixing styles when declaring custom validation rules, as shown below.

:thumbsup:

```php
$request->validate([
    'client_id' => ['required', 'exists:clients,id'],
    'name'      => ['required', 'min:2', Rule::unique(Branch::class)->where('client_id', $request->input('client_id'))],
    'address'   => ['nullable', 'min:2'],
    'city'      => ['nullable', 'min:2'],
    'country'   => ['nullable', 'min:2'],
    'phone'     => ['nullable', 'min:2'],
    'email'     => ['nullable', 'min:2'],
]);
```

:thumbsdown:

```php
$request->validate([
    'client_id' => 'required|exists:clients,id',
    'name'      => ['required', 'min:2', Rule::unique(Branch::class)->where('client_id', $request->input('client_id'))],
    'address'   => 'nullable|min:2',
    'city'      => 'nullable|min:2',
    'country'   => 'nullable|min:2',
    'phone'     => 'nullable|min:2',
    'email'     => 'nullable|min:2',
]);
```

## Naming conventions

| Type            | Rule                      | Suffix                        | Example  |
| --------------- |---------------------------|-------------------------------| ---------|
| Class           | PascalCase                |                               | *MyClass.php*              |
| Controller      | singular                  | Controller                    | *PostController.php*       |
| Model           | singular,                 |                               | *Post.php*                  |
| Table           | plural, snake_case        |                               | *user_posts*                    |
| Columns         | singular, snake_case      |                               | *created_at, user_id*            |
| Route           | plural                    |                               | *users/{username}/ban*          |
| Named route     | dot-notation, snake-case  |                               | *settings.team* |
| Method          | camelCase                 |                               | *getUsersPosts()*           |
| Variable        | camelCase                 |                               | *$post*                     |
| View            | kebab-case                |                               | *session-expired.blade.php* |
| Config          | kebab-case                |                               | *services-stripe.php*       |
| Event           | *subject for event*       | *a verb*                      | *TeamDeleted.php*      |
| Provider        |                           | Provider                      | *AppServiceProvider.php* |
| Command         |                           |                               | *Install.php* |
| Request         |                           | Request                       | *CreateTokenRequest.php* |
| Listener        | *descriptive*             | Notification?                 | *UpdateTrialEndingDate.php, SendShipmentNotification.php* |
| Repository      |                           | Repository                    | *UserRepository.php* |
| Resource        | singular                  |                               | *User.php* |
| Helper          | snake_case                |                               | *array_has()* |

## PHPCS

The PHPCS file is available [here](/phpcs.xml), if you for any reason need only this specific file.
