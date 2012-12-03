jQuery ($) ->
  $('pre').mouseover ->
    $(this).animate({width: '932px'})

  $('pre').mouseleave ->
    $(this).animate({width: '672px'})