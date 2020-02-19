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

  def ticket_lottery_contestants(exhibit)
    patrons = []
    @patrons.each do |patron|
      patron.interests.each do |interest|
        patrons << patron if exhibit.name && patron.spending_money < exhibit.cost
      end
    end
    patrons.uniq
  end

  def draw_lottery_winner(exhibit)
    return nil if ticket_lottery_contestants(exhibit).sample(1) == []
    ticket_lottery_contestants(exhibit).sample(1).first.name
  end

  def announce_lottery_winner(exhibit)
    return "No winners for this lottery" if draw_lottery_winner(exhibit).nil?
    "#{draw_lottery_winner(exhibit)} has won the Dead Sea Scrolls exhibit lottery"
  end
end
