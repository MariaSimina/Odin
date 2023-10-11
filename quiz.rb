class Question
  attr_accessor :prompt, :answer
  def initialize(prompt, answer)
    @prompt = prompt
    @answer = answer
  end
end

prompt1 = "What color are apples?\n(a)red\n(b)purple\n(c)orange"
prompt2 = "What color are bananas?\n(a)pink\n(b)red\n(c)yellow"
prompt3 = "What color are pears?\n(a)yellow\n(b)green\n(c)orange"

questions = [
  Question.new(prompt1, "a"),
  Question.new(prompt2, "c"),
  Question.new(prompt3, "b")
]

def run_test(questions)
  answer = ""
  score = 0
  questions.each do |question|
    puts question.prompt
    answer = gets.chomp
    if answer == question.answer
      score += 1
    end
  end
  puts "You got #{score}/#{questions.length}"
end

run_test(questions)