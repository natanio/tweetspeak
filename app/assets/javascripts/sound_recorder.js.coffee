class @SoundRecorder
  constructor: (@title) ->
  start: ->
    SC.record
      start: ->
        $('#recordBtn').hide()
        $('#stopBtn').html 'Stop'
      progress: (ms, avgPeak) => @updateTimer(ms)
  stop: ->
    SC.recordStop()
    $('#recordBtn').show()
    $('#stopBtn').html('')
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