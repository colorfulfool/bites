module LocateOnPageHelper
  def locate(object)
    ".#{object.class.name.downcase}[data-id=#{object.id}]"
  end
end