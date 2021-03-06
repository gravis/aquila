# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.

#= require turbolinks
#= require moment_js
#= require moment_js_date
#= require goldbricks

application_ready = ->

  time_zone = window.time_zone
  moment.locale window.locale
  $('date').each -> rendermoment @, time_zone
  $('.tzinfo').text(time_zone)

$(document).ready(application_ready)
$(document).on('page:load', application_ready)
