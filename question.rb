class Question
  attr_reader(:answer)

  def initialize
    @first_number = rand(1...20)
    @second_number = rand(1...20)
    @operator = rand(1..2)

    case @operator

    when 1
      @answer = @first_number + @second_number
      @operator_symbol = "plus"

    when 2
      @answer = @first_number - @second_number
      @operator_symbol = "minus"
    end
  end

  def question_string
    "What does #{@first_number} #{@operator_symbol} #{@second_number} equal?"
  end

  def correct?(input)
    if input === @answer
      return true
    else
      return false
    end
  end

end