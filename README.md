Code Happening 2012
===================

This is a visual and textual random generator based on a Twitter scrapper, made as a desperate attempt to be part of the Code Happening 2012 organized by [scvsoft](https://github.com/scvsoft)

## Required software

  1. RVM
  1. MongoDB
  1. A decent browser, webkit preferably

## How to run

  1. Clone
  1. cd to the app's directory with the console to create the gemset
  1. run ```bundle install```
  1. Run the web app's server with ```thin start```
  1. Open the app on http://localhost:3000 (the MongoDB daemon should be running)

## First steps

  1. You will be prompted to load some data the first time by clicking a link
  1. Then the fun begins
  1. you may wipe the stored data by going to http://localhost:3000/clean
  1. you also may load more data going to http://localhost:3000/update

## Notes

A demo is available [here](http://www.welovetocode.com.ar/)

Thanks to [bartaz](https://github.com/bartaz) for his library impress.js. It is great and he writes source code in way that helps you to learn a lot from him.
Also I thank to Kyle Banker, author of MongoDB in Action, who inspired this app.