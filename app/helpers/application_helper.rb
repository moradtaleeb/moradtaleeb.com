module ApplicationHelper

  def footer_tags category
    if category == "all"
      Tag.all
    else
      Tag.where(category_id: category)
    end
  end

end
