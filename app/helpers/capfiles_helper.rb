module CapfilesHelper

  def recipe_class recipe
    case
    when recipe.name == 'default' then 'selected default'
    when recipe.created_at > 7.days.ago then 'new'
    else
      ''
    end
  end
end
