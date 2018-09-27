class CandidateManager
  def initialize(options={})
    @candidate = options[:candidate]

    @candidate_experience        = options[:candidate_experience]
    @candidate_experience_params = options[:candidate_experience_params]
  end

  def process
    # create_or_update
  end

  def optionsForSelectYear
    @years = arrayForSelect("ANO", "ANOS", 15)
  end

  def optionsForSelectMonth
    @months = arrayForSelect("MÊS", "MESES", 11)
  end

  def create_candidate_experience
    @candidate.build_candidate_experience
    candidate_experience = @candidate.candidate_experience
    candidate_experience.save
  end

  def create_candidate_experience_function
    exp_functions = @candidate_experience_params[:candidate_experience_function]

    exp_functions.each do |function|
      # verify to avoid duplicate
      if @candidate_experience.functions_time_period.present? && @candidate_experience.functions_time_period.find_by_function_id(function[:function_id]).present?
        exp_function = @candidate_experience.functions_time_period.find_by_function_id(function[:function_id])
        exp_function.update_attributes(function)
      else
        exp_function = CandidateExperienceFunction.new(function)
        @candidate_experience.functions_time_period << exp_function
      end
    end

    return @candidate_experience.save
  end

  private
    def arrayForSelect(singular, plural, max)
      array = []
      for i in 0..max
        if i == 1
          array << ["#{i} #{singular}", "#{i}"]
        else
          array << ["#{i} #{plural}", "#{i}"]
        end
      end
      array
    end
end