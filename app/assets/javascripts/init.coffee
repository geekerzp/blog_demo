window.App ||= {}

App.init = ->
  $("a, span, i, div").tooltip()

  $('.summernote_editor').summernote
    height: 300
    minHeight: null
    maxHeight: null
    focus: true

  $('.summernote_editor').summernote()

$(document).on "page:change", ->
  App.init()
