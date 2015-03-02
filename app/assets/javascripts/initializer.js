"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Notifier  = require('./modules/notifier');
var Favourite = require('./modules/favourite');

// BigBird Initializer
var initializer = new BigBird.Initializer({
  modules: {
    common: {
      initialize: function initializeAction() {
        var notifier = new Notifier(),
            favourite = new Favourite();
      }
    }
  }
});

