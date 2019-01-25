class TaskWithDeadline < Task
  attr_reader :deadline

  def initialize(description, status, deadline = "")
    super(description, status)
    @deadline = deadline
  end

  def to_s
  "#{description} | #{status} | #{deadline}"
  end

end
