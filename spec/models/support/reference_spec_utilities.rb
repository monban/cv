module Reference::Utilities
  def mutated_attributes
    self.name = name.reverse
    attributes
  end
  
  def to_paramater_hash
    {self.class.to_s.downcase => attributes}
  end
end
