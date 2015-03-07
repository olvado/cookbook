"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: $('.app'),

  events: {
    "click .js-menu": "toggleNavigation"
  },

  subscriptions: {
    "notifier:send": "toggleNavigation"
  },

  template: function(message) {
    return $('<p>', {class: "notifier-message", text: message});
  },

  toggleNavigation: function(e) {
    e.preventDefault();
    e.stopPropagation();
    console.log('toggle');
    this.$el.toggleClass('nav_is_open');
  }

});
