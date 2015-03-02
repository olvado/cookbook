"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Favourite   = require('./modules/favourite');

// BigBird Initializer
var initializer = new BigBird.Initializer({
  modules: {
    common: {
      initialize: function initializeAction() {
        var favourite = new Favourite();
      }
    }
  }
});

