jQuery ->
    $container =  $("#masonry-container")
    $container.imagesLoaded ->
        $container.masonry ->
            itemSelector : '.box'
