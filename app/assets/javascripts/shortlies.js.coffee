ready = ->

  clip = new Clipboard('.copy-link')
  console.log clip



$(document).ready(ready)
$(document).on('page:load', ready)

