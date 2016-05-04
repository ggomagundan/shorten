ready = ->

  clip = new Clipboard('.copy-link')
  console.log clip

  toastr.options = {
    "positionClass": "toast-bottom-center",
  }

  $(".copy-link").click ->
    toastr.info "Copy Success"

  $('.material-card > .mc-btn-action').click ->
    card = $(this).parent('.material-card')
    icon = $(this).children('i')
    icon.addClass 'fa-spin-fast'
    if card.hasClass('mc-active')
      card.removeClass 'mc-active'
      window.setTimeout (->
        icon.removeClass('fa-arrow-left').removeClass('fa-spin-fast').addClass 'fa-bars'
      ), 800
    else
      card.addClass 'mc-active'
      window.setTimeout (->
        icon.removeClass('fa-bars').removeClass('fa-spin-fast').addClass 'fa-arrow-left'
      ), 800



$(document).ready(ready)
$(document).on('page:load', ready)

