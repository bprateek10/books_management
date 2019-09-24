json.id @author.id
json.first_name @author.first_name
json.last_name @author.last_name
json.date_of_birth @author.date_of_birth
json.books do
  json.array! @author.books do |book|
    json.id book.id
    json.title book.title
  end
end
