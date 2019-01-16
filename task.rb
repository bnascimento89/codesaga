class Task
  attr_accessor :description, :status

  def initialize(description, status = false)
    @description = description
    @status = status
  end

  def to_s
  "#{description} | #{status}"
  end
end
