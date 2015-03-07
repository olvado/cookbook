"use strict";

var $ = require('jquery');
var BigBird = require('bigbird');

// BigBird Nodules
var Navigation = require('./modules/navigation');
var Notifier  = require('./modules/notifier');
var Favourite = require('./modules/favourite');

// BigBird Initializer
var initializer = new BigBird.Initializer({
  modules: {
    common: {
      initialize: function initializeAction() {
        var navigation = new Navigation();
        var notifier  = new Notifier();
        var favourite = new Favourite();
      }
    },
    users: {
      show: function showAction() {

      }
    }
  }
});

