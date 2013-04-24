client.views.index = Backbone.View.extend(
  build: (data) ->
    [
      ['section#top', [
        ['header', [
          ['h1.page-title', 'Awesome Project']
          ['h2.page-subtitle', 'This project is going to be awesome!']
      ]]
    ]
  )