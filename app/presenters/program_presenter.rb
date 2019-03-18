class ProgramPresenter

  def initialize(program, view)
    @program = program
    @view = view
  end

  def start_date
    "Starts at: #{@program.to_be_start_from.strftime("%B, %d %Y")}"
  end

  def end_date
    "End on: #{@program.to_be_end_upto.strftime("%B, %d %Y")}"
  end

end
