class ReferencesDetector
  def self.references_in(text)
    text.scan(/\[.+:(\d+)\]/).flatten.map do |id|
      Experiment.find(id)
    end
  end

  def self.declarations_in(text)
    text.scan(/\[([\S ]+)\]/).flatten.map do |name|
      name
    end
  end
end