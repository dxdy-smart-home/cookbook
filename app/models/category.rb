class Category < Tag
  default_scope { where(context: :category) }
end
