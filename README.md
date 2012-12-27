Code Happening 2012
===================

This is a visual and textual random generator based on a Twitter scrapper, made as a desperate attempt to be part of the Code Happening 2012 organized by [scvsoft](https://github.com/scvsoft)

## Required software (and hardware)

  1. RVM
  1. MongoDB
  1. A decent browser, webkit preferably
  1. ...lots of memory :-)

## How to run

  1. Clone
  1. cd to the app's directory with the console to create the gemset
  1. ```bundle install```
  1. edit the ```config/config.yml``` accordingly (you may use my twitter keys if you want)
  1. Run the web app's server with ```thin start``` (for production settings fill ```config/thin.yml``` with the appropriate values for your production environment and run ```thin start -C config/thin.yml``)
  1. Open the app on http://localhost:3000 (the MongoDB daemon should be already running)

## First steps

  1. You will be prompted to load some data the first time by clicking a link
  1. Then the fun begins
  1. you may wipe the stored data by going to http://localhost:3000/clean
  1. you also may load more data going to http://localhost:3000/update

## Notes

A demo is available [here](http://www.welovetocode.com.ar/)

Thanks to [bartaz](https://github.com/bartaz) for his library impress.js. It is great library which is a reflection of his author, he writes source code in way that helps you to learn a lot from him.

Also thanks to _Kyle Banker_, author of _MongoDB in Action_, who inspired this app.