require 'digest/md5'

class Capfile < ActiveRecord::Base

  attr_accessible :content, :identifier, :recipes

  serialize :recipes, Hash

  before_save :calculate_identifier

  private
  def calculate_identifier
    self.identifier = Digest::MD5.hexdigest(self.recipes)
  end
end
