module Section::Utilities
  def mutated_attributes
    self.title = title.reverse
    self.attributes
  end
  
  def to_paramater_hash
    {self.class.to_s.downcase => attributes}
  end
end
