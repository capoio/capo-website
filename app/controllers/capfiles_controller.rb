class CapfilesController < ApplicationController

  def new
    @capfile = Capfile.new
  end

  def create
    recipes_hash = Recipe.where(id: params[:recipes]).collect { |r| Hash[r.id, r.version] }
    identifier = Digest::MD5.hexdigest(recipes_hash.join)
    @capfile = Capfile.find_or_initialize_by_identifier identifier
    @capfile.attributes = {identifier: identifier, recipes: recipes_hash}
    @capfile.save!
    redirect_to @capfile
  end

end