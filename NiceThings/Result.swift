/**
 Represents the result of, for example, an asynchronous method.
 Can be used synchronously, but it's really intended for reporting asynchronous successes or failures.
 Use Swift's standard error handling (`try`, `throw`, `catch`) for synchronous methods.
 
 - Success: It worked! Here's your data.
 - Failure: It failed! Here's the error.
 */
enum Result<T, U> {
    case success(T)
    case failure(U)
}
