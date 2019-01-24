class Task
  attr_accessor :description, :status

  def initialize(description, status = false)
    @description = description
    @status = status
  end

  def to_s
  "#{description} | #{status}"
  end

  def mark_as_done
    @status = true
    puts "Task is done!"
  end

  def has_task (term)
      if @description.downcase == term.downcase
        true
      end
  end
end
