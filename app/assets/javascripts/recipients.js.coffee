@select2 = ->
  $("#message_subject_message_recipient_ids").select2();
  if $('.recipient_ids').length > 0
    load_recipients()

#$(document).ready(select2())
#$(document).on('page:load', select2())

load_recipients = ->
  ids = $('.recipient_ids').attr("value")
  recipient_ids = $.parseJSON(ids)
  recipients = $(".chosen2").select2()
  recipients.val(recipient_ids).trigger("change")

@append_recipients = (ids)->
  append_ids  = $.parseJSON(ids)
  current_ids = $('.recipient_ids').attr("value")
  cur_ids     = $.parseJSON(current_ids)
  new_ids     = append_ids.concat(cur_ids)
  uniq_ids    = jQuery.unique(new_ids)
  recipients  = $(".chosen2").select2()
  recipients.val(uniq_ids).trigger("change")
  update_recipient_ids(uniq_ids)

update_recipient_ids = (uniq_ids) ->
  recipient_ids = convert_array_to_attr(uniq_ids)
  $('.recipient_ids').attr("value", recipient_ids)

convert_array_to_attr = (array) ->
  attr = '['
  $(array).each (index)->
    attr += '"'
    attr += this.toString()
    attr += '"'
    if array.length-1 > index
      attr += ', '
  attr += ']'
