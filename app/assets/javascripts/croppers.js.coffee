croppers = {}

tearDownCroppers = ->
  for name, element of croppers
    element?.croppie('destroy')

    delete croppers[name]

setupCropper = (cropElement) ->
  margin = 75

  config = cropElement.data('cropper')
  viewport = config.viewport
  name = config.for

  boundary = {
    width: viewport.width + 2 * margin,
    height: viewport.height + 2 * margin
  }

  croppers[name] = cropElement.croppie(
    viewport: viewport,
    boundary: boundary
  )

processResults = (name, cropper) ->
  targetFormField = jQuery("[data-cropped-version-of='#{name}']")
  previewImage = jQuery("img[data-preview-of='#{name}']")

  cropper.croppie('result',
    type: 'canvas',
    size: 'viewport',
    format: 'png',
    enableExif: true
  ).then((resp) ->
    targetFormField.val(resp)
    previewImage.attr('src', resp)
  )

setFilename = (filename) ->
  # FIXME: this is an implicit dependency
  jQuery('#filename').val(filename.split('.')[0])

bindCroppers = (file) ->
  return (e) ->
    for _, cropper of croppers
      cropper.croppie('bind',
        # e.target.result = base64-encoded version of the file
        url: e.target.result
      )

    setFilename(file.name)

readFile = (input) ->
  if (input.files && input.files[0])
    reader = new FileReader()

    reader.onload = bindCroppers(input.files[0])

    reader.readAsDataURL(input.files[0])

prepareCroppers = () ->
  jQuery('[data-cropper]').each (_, element) ->
    setupCropper(jQuery(element))

  #FIXME: this is an implicit dependency
  jQuery('#upload').on('change', -> readFile(@))

  jQuery('[data-behavior="cropper-create-preview"]').on 'click', (ev) ->
    for name, cropper of croppers
      processResults(name, cropper)

document.addEventListener('turbolinks:load', prepareCroppers)
document.addEventListener('turbolinks:visit', tearDownCroppers)
