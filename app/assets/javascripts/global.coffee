jQuery(document).on 'turbolinks:load', ->
  items = $('#items')


  items.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)


  items.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)

  items.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  items.on 'cocoon:after-remove', (e, removed_el) ->


