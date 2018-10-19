module IdeasHelper
  def enum_to_select(input)
    input.keys.map{|k| [k.humanize, k]}
  end
end
