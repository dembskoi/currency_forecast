class ApplicationDecorator < Draper::Decorator
  include Draper::LazyHelpers
  extend Draper::LazyHelpers

  delegate_all
end
