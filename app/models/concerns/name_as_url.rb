module NameAsUrl
  extend ActiveSupport::Concern

  included do
    before_save :populate_slug
  end

  def populate_slug
    self.slug = product.name.parameterize unless slug.present?
  end

  def to_param
    slug
  end
end