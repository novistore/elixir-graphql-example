for i <- 1..3 do
  {:ok, product} = Novistore.Product.create_product(%{
    title: "Product #{i}",
    description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero nemo reprehenderit expedita, soluta et a unde nihil quaerat laudantium autem quae pariatur, aperiam corporis quasi dicta incidunt mollitia fugit qui.",
    price: 10 * i
  })

  for x <- 1..3 do
    {:ok, _review} = Novistore.Review.create_review(%{
      product_id: product.id,
      email: "jane@smith.net",
      title: "Beautiful product",
      body: "This is a beautiful product, great price too!"
    })
  end
end
