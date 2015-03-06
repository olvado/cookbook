"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: $('.js-notifier'),

  subscriptions: {
    "notifier:send": "sendMessage"
  },

  template: function(message) {
    return $('<p>', {class: "notifier-message", text: message});
  },

  sendMessage: function(message) {
    this.$el.html(this.template(message));
  }

});
