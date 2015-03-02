"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: ".app",

  events: {
    "submit .js-favourite": "onFormSubmit"
  },

  onFormSubmit: function(e) {
    e.preventDefault();
    e.stopPropagation();
    var $form  = $(e.currentTarget),
        button = $('input[type=submit]', $form),
        count  = $(".js-favourite_count", $form);

    $.ajax({
      url: $form.attr("action"),
      type: $form.attr("method"),
      data: $form.serialize(),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(response) {
        count.text(response.favourite_count);
        $form.toggleClass("is_active");
        button.val($form.hasClass("is_active") ? "Remove favourite" : "Add favourite" );
      }
    });
  }

});
