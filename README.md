# NiceThings

[![Build Status](https://travis-ci.org/roadfire/NiceThings.svg?branch=master)](https://travis-ci.org/roadfire/NiceThings)

A collection of extensions and methods to make Swift and iOS even better

Inspired by [Soroush Khanlou's talk, You Deserve Nice Things](https://www.youtube.com/watch?v=KhYfe4R2Es0&index=7&list=PLAVm70iJlMuvrV8Ut6fDQN-_X5AhPFtux), at #Pragma Conference 2017.

## Load a view from a nib
To load a view from a nib, don't use this:

`let view = Bundle.main.loadNibNamed("YourView", owner: self, options: nil)?.first as? YourView`

Instead, use this:

`let view = YourView().loadNib()`

Just grab [UIView+loadNib.swift](https://github.com/roadfire/NiceThings/blob/master/NiceThings/UIView%2BloadNib.swift) to make loading nibs super easy.

Thanks to [Matt Lorentz](https://github.com/mplorentz) for contributing this!

## Dequeue table view cells
To dequeue a table view cell, don't use this:

`dequeueReusableCell(withIdentifier identifier: String)`

Instead, use this:

`dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath)`

Why? Look closely at the documentation for each, and check out the Return Value. On the second, it says:

> A UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.

This is nicer than checking for nil and instantiating a new cell.

## Show Build Durations in Xcode

Because sometimes you want to time your build without `xcodebuild`. Just run this command in your Terminal:

`defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES`
