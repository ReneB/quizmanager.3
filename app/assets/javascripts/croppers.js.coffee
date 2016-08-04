# Elements needed to set this script up:
# - input[type=file]#upload                     // when uploading a file to this element, the croppers get initialized
# - *[data-cropper]                             // data-cropper attribute should contain JSON config like this:
#                                               // {
#                                               //   // this name is also the name that is being reused in the elements named above
#                                               //   for: freeform-name-of-image,
#                                               //   viewport: {
#                                               //     width: int,
#                                               //     height: int
#                                               //   }
#                                               // }

# To generate previews
# - img[data-preview-of="name"]                 // optional. this image will receive a preview of the cropper with the same name in the 'for'

# To copy image to a form
# - *[data-behavior="cropper-create-preview"]   // when this element is clicked, all croppers copy their image to the form elements
# - input[data-cropped-version-of="name"]       // the form elements linked to the croppers. Match is made based on name variable

# Convenience
# - input#filename                              // optional. automatically set when file is selected


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
  jQuery('input#filename').val(filename.split('.')[0])

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
  jQuery('input[type=file]#upload').on('change', -> readFile(@))

  jQuery('[data-behavior="cropper-create-preview"]').on 'click', (ev) ->
    for name, cropper of croppers
      processResults(name, cropper)

document.addEventListener('turbolinks:load', prepareCroppers)
document.addEventListener('turbolinks:visit', tearDownCroppers)
