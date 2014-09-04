class Jesus
  def name
    "Jesus"
  end

  def choice(record, cooperate_score, defect_score, win_score, lose_score)
    cooperate = true
  end
end

class Devil
  def name
    "Devil"
  end

  def choice(record, cooperate_score, defect_score, win_score, lose_score)
    cooperate = false
  end
end

class Moses
  def name
    "Moses"
  end

  def choice(record, cooperate_score, defect_score, win_score, lose_score)
    cooperate = true

    if record.length == 0
      cooperate = true
    elsif (record.last == defect_score) || (record.last == lose_score)
      cooperate = false
    elsif (record.last == cooperate_score) || (record.last == win_score)
      cooperate = true
    end
    cooperate
  end
end

class Yourclass

  def initialize
  end

  def name
    "Layne"
  end

  def choice(record, cooperate_score, defect_score, win_score, lose_score)
    cooperate = true

    if record.length == 0
      cooperate = true
    elsif (record.last == defect_score) || (record.last == lose_score)
      cooperate = false
    elsif record.length % 10 != 0
      cooperate = false
    end
    cooperate
  end

end



def fight

  #-------Enter combatants!------
  player_one = Yourclass.new
  player_two = Devil.new
  #------------------------------

  player_one_record = []
  player_two_record = []
  round = 0

  # Scoring!
  cooperate_score = 6
  defect_score = -17
  win_score = 3
  lose_score = -1

  while round < 100


    if player_one.choice(player_one_record, cooperate_score, defect_score, win_score, lose_score)
      if player_two.choice(player_two_record, cooperate_score, defect_score, win_score, lose_score)
        player_one_record.push(cooperate_score)
        player_two_record.push(cooperate_score)

      elsif !player_two.choice(player_two_record, cooperate_score, defect_score, win_score, lose_score)
        player_one_record.push(lose_score)
        player_two_record.push(win_score)

      end

    elsif !player_one.choice(player_one_record, cooperate_score, defect_score, win_score, lose_score)
      if player_two.choice(player_two_record, cooperate_score, defect_score, win_score, lose_score)
        player_one_record.push(win_score)
        player_two_record.push(lose_score)

      elsif !player_two.choice(player_two_record, cooperate_score, defect_score, win_score, lose_score)
        player_one_record.push(defect_score)
        player_two_record.push(defect_score)

      end
    end
    round += 1
  end

  p "="*50
  p "#{player_one.name} score: #{player_one_final_score = player_one_record.inject{|sum,x| sum + x }}"
  p "#{player_two.name} score: #{player_two_final_score = player_two_record.inject{|sum,x| sum + x }}"
  p "="*50

end

fight

