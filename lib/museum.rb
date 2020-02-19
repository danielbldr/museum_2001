class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_per_exhibit = {}
    @exhibits.each {|exhibit| patrons_per_exhibit[exhibit] = []}
    @patrons.each do |patron|
      patron.interests.each do |interest|
        recommend_exhibits(patron).each do |exhibit|
          patrons_per_exhibit[exhibit] << patron if exhibit.name == interest
        end
      end
    end
    patrons_per_exhibit
  end
end
