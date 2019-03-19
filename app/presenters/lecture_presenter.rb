class LecturePresenter

  def initialize(lecture, view)
    @lecture = lecture
    @view = view
  end

  def start_date
    begin
      @lecture.begin_time.to_date
    rescue Exception => e
      ''
    end
  end

  def start_time
    begin
      @lecture.begin_time.strftime("%H:%M %p")
    rescue Exception => e
      ''
    end
  end

  def end_time
    begin
      @lecture.end_time.strftime("%H:%M %p")
    rescue Exception => e
      ''
    end
  end

end
