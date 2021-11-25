require 'json'

module FakeDatabaseHelper
  def database
    file = File.read('src/products.json')
    JSON.parse(file)
  end
end