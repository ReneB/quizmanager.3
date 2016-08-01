window.prepareCroppers = () ->
  margin = 75

  setFilename = (filename) ->
    jQuery('#filename').val(filename.split('.')[0])

  bindCroppers = (file) ->
    return (e) ->
      questionCrop.croppie('bind',
        # e.target.result = base64-encoded version of the file
        url: e.target.result
      )

      answerCrop.croppie('bind',
        url: e.target.result
      )

      setFilename(file.name)

  readFile = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()

      reader.onload = bindCroppers(input.files[0])

      reader.readAsDataURL(input.files[0])

  cropElement = jQuery('#crop-for-question')

  return unless cropElement.length > 0

  viewport = cropElement.data('viewport')
  boundary = {
    width: viewport.width + 2 * margin,
    height: viewport.height + 2 * margin
  }

  questionCrop = cropElement.croppie(
    viewport: viewport,
    boundary: boundary
  )

  cropElement = jQuery('#crop-for-answer')
  viewport = cropElement.data('viewport')
  boundary = {
    width: viewport.width + 2 * margin,
    height: viewport.height + 2 * margin
  }

  answerCrop = cropElement.croppie(
    viewport: viewport,
    boundary: boundary
  )

  jQuery('#upload').on('change', () -> readFile(this))

  jQuery('.upload-result').on('click', (ev) ->
    answerCrop.croppie('result',
      type: 'canvas',
      size: 'viewport',
      format: 'png'
    ).then((resp) ->
      jQuery('#answer_image').val(resp)

      jQuery('#preview-answer').attr('src', resp)
    )

    questionCrop.croppie('result',
      type: 'canvas',
      size: 'viewport',
      format: 'png'
    ).then((resp) ->
      jQuery('#question_image').val(resp)

      jQuery('#preview-question').attr('src', resp)
    )
  )

document.addEventListener('turbolinks:load', prepareCroppers)

