class @SoundRecorder
  constructor: (@title) ->
  $('.stop-button').hide()
  start: ->
    SC.record
      start: ->
        $('.record-button').hide()
        $('#stopBtn').html '<div class="stop-button"><a href="#" id="stopBtn" class="button"><span class="glyphicon glyphicon-stop"></span></a></div>'
      progress: (ms, avgPeak) => @updateTimer(ms)
  stop: ->
    SC.recordStop()
    SC.recordPlay()
    $('.record-button').show()
    $('.stop-button').hide()
    $('#uploadBtn').html('Upload')
  reset: -> updateTimer(0)
  upload: (callback) -> 
    $('#uploadBtn').html('')
    $("#uploadStatus").html('Uploading...')
    SC.recordUpload
      track: { 
        title: @title,
        sharing: "private"
       }
      callback
  updateTimer: (ms) -> $("#timer").text(SC.Helper.millisecondsToHMS ms)