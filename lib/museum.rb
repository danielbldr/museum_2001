class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommend_exhibits_for_patron = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        recommend_exhibits_for_patron << exhibit if exhibit.name == interest
      end
    end
    recommend_exhibits_for_patron
  end
end
