module Section::Mutator
  def mutated_attributes
    self.title = title.reverse
    self.attributes
  end
end
