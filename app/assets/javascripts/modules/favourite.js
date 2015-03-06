"use strict";

var $ = require("jquery");
var BigBird = require("bigbird");

module.exports = BigBird.Module.extend({

  el: ".app-content",

  events: {
    "submit .js-favourite": "onFormSubmit"
  },

  initialize: function() {
    this.$favouritesList = this.$els('favourites-list');
  },

  onFormSubmit: function(e) {
    e.preventDefault();
    e.stopPropagation();
    var _this = this,
        $form  = $(e.currentTarget),
        button = $('input[type=submit]', $form),
        count  = $(".js-favourite_count", $form),
        button_text = "",
        message = "";

    $.ajax({
      url: $form.attr("action"),
      type: $form.attr("method"),
      data: $form.serialize(),
      success: function(response) {
        var recipe = $form.closest('.list-item--recipe');
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

        if (_this.$els.length > 0) {
          if ($form.hasClass("is_active")) {
            _this.addToList(recipe);
          } else {
            _this.removeFromList(recipe.data('id'));
          }
        }
        
        _this.publish("notifier:send", message);
      },
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
    });
  },

  addToList: function(item) {
    item.clone().appendTo(this.$favouritesList);
  },

  removeFromList: function(bb_el) {

  }
});
