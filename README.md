# NiceThings
A collection of extensions and methods to make Swift and iOS even better

Inspired by [Soroush Khanlou's talk, You Deserve Nice Things](https://www.youtube.com/watch?v=KhYfe4R2Es0&index=7&list=PLAVm70iJlMuvrV8Ut6fDQN-_X5AhPFtux), at #Pragma Conference 2017.

## Dequeuing table view cells
To dequeue a table view cell, don't use this:

`dequeueReusableCell(withIdentifier identifier: String)`

Instead, use this:

`dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath)`

Why? Look closely at the documentation for each, and check out the Return Value. On the second, it says:

> A UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.

This is nicer than checking for nil and instantiating a new cell.

## The Result type

The Result monad is a better way to handle operations that return one type on success and another on failure. It replaces code like this:

```
let completion = { (model: Model?, error: Error?) in
    switch (model, error) {
    case (.some(_), .none):
        print("Success! We got our object.")
    case (.none, .some(_)):
        print(error)
    case (.none, .none):
        print("This shouldn't happen.")
    case (.some, .some):
        print("This shouldn't happen either.")
    }
}
```

Into this:

```
let completion = { (result: Result<Model, Error>) in
    switch (result) {
    case .success(let model):
        print("Success! We got our object back")
    case .failure(let error):
        print("The function failed, but in style!")
    }
}
```
