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
    var fav = this,
        $form  = $(e.currentTarget),
        button = $('input[type=submit]', $form),
        count  = $(".js-favourite_count", $form),
        button_text = "",
        message = "";

    $.ajax({
      url: $form.attr("action"),
      type: $form.attr("method"),
      data: $form.serialize(),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(response) {
        
        count.text(response.favourite_count);
        $form.toggleClass("is_active");

        if ($form.hasClass("is_active")) {
          button_text =  "Remove favourite";
          message = "Recipe favourited";
        } else {
          button_text =  "Add favourite";
          message = "Favourite removed";
        }

        button.val(button_text);
        fav.publish("notifier:send", message);
      }
    });
  }

});
