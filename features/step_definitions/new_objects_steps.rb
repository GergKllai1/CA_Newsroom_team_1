Given("the following articles exists") do |table|
  table.hashes.each do |article|
    article = create(:article, article)
  end
end