class Numeric
  def limited(min, max)
    self < min ? 0 : self > 10 ? 10 : self
  end
end

class Person
  attr_accessor :bank_account
  attr_reader :name, :hygiene, :happiness

  def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
    @name = name
    @bank_account = bank_account
    @happiness = happiness
    @hygiene = hygiene
  end

  def happiness=(happiness)
    @happiness = happiness.limited(0,10)
  end

  def hygiene=(hygiene)
    @hygiene = hygiene.limited(0,10)
  end

  def happy?
    @happiness > 7
  end

  def clean?
    @hygiene > 7
  end

  def get_paid(salary)
    @bank_account += salary
    'all about the benjamins'
  end

  def take_bath
    hyg = @hygiene + 4
    self.hygiene=(hyg)
    '♪ Rub-a-dub just relaxing in the tub ♫'
  end

  def work_out
    hyg = @hygiene - 3
    self.hygiene=(hyg)
    hap = @happiness + 2
    self.happiness=(hap)
    '♪ another one bites the dust ♫'
  end

  def call_friend(friend)
    hap = @happiness + 3
    self.happiness=(hap)
    friend.happiness += 3
    "Hi #{friend.name}! It's #{self.name}. How are you?"
  end

  def start_conversation(person, topic)
    case topic
      when "politics"
        hap = @happiness - 2
        self.happiness=(hap)
        person.happiness -= 2
        return 'blah blah partisan blah lobbyist'
      when "weather"
        hap = @happiness + 1
        self.happiness=(hap)
        person.happiness += 1
        return 'blah blah sun blah rain'
      else
        return 'blah blah blah blah blah'
    end
  end
end
