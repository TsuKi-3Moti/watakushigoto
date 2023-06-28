class AnswerForm
  include ActiveModel::Model

  attr_accessor :opinion, :input_tag_name, :answer, :question

  with_options presence: true do
    validates :opinion
    validates :input_tag_name
  end

  def initialize(attributes = nil, answer: Answer.new, question: answer.question)
    @answer = answer
    @question = question
    @opinion = answer.opinion
    @input_tag_name = answer.input_tag_name
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      @answer = @question.answers.create!(opinion: opinion)
      associate_tags(save_tags)
    end

  rescue ActiveRecord::RecordInvalid
    false
  end

  def update
    return if invalid?

    ActiveRecord::Base.transaction do
      @answer.update!(opinion: opinion)
      @answer.relationships.destroy_all
      associate_tags(save_tags)
    end

  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  # 戻り値はtagの配列
  def save_tags
    tag_names = input_tag_name.gsub(/[,，、　]/," ").strip.split(/\s+/)
    tag_names.map { |name| Tag.find_or_create_by!(name: name) }.uniq
  end

  # answerにtagを紐づける
  def associate_tags(tags)
    tags.each do |tag|
      @answer.tags << tag
    end
  end
end
