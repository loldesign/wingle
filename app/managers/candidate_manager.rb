class CandidateManager
  def initialize(options={})
    @candidate = options[:candidate]

    @candidate_experience        = options[:candidate_experience]
    @candidate_experience_params = options[:candidate_experience_params]

    @candidate_company_params         = options[:candidate_company_params]
    @candidate_current_company        = options[:candidate_current_company]
    @candidate_current_company_params = options[:candidate_current_company_params]

    @candidate_education                 = options[:candidate_education]
    @candidate_education_language_params = options[:candidate_education_language_params]
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
      if @candidate_experience.candidate_experience_functions.present? && @candidate_experience.candidate_experience_functions.find_by_function_id(function[:function_id]).present?
        exp_function = @candidate_experience.candidate_experience_functions.find_by_function_id(function[:function_id])
        exp_function.update_attributes(function)
      else
        exp_function = CandidateExperienceFunction.new(function)
        @candidate_experience.candidate_experience_functions << exp_function
      end
    end

    return @candidate_experience.save
  end

  def create_candidate_experience_titles
    title_experience = @candidate_experience_params[:candidate_experience_titles]

    title_experience.each do |title|
      # verify to avoid duplicate
      if @candidate_experience.title_experiences.present? && @candidate_experience.title_experiences.find_by_title_id(title[:title_id]).present?
        exp_title = @candidate_experience.title_experiences.find_by_title_id(title[:title_id])
        exp_title.update_attributes(title)
      else
        exp_title = CandidateExperienceTitle.new(title)
        @candidate_experience.title_experiences << exp_title
      end
    end

    return @candidate_experience.save
  end

  def create_or_update_candidate_companies
    if @candidate_company_params.present?
      CandidateCompany.transaction do
        @candidate_company_params.each do |co|
          if co[:id].present? && co[:name].present?
            filter_date_params(co)
            co[:months] = calculate_months(co)
            company = CandidateCompany.update(co[:id], co)
          elsif co[:id].present? && co[:name].nil?
            company = destroy_candidate_company(co)
          else
            filter_date_params(co)
            co[:months] = calculate_months(co)
            company = CandidateCompany.new(co)
            @candidate.candidate_companies << company
          end
          raise ActiveRecord::Rollback if !company.save
        end
      end
      return true
    else
      false
    end
  end

  def create_candidate_current_company
    @candidate.build_candidate_current_company
    candidate_current_company = @candidate.candidate_current_company
    candidate_current_company.save
  end

  def update_candidate_current_companies
    if @candidate_current_company_params.present?
      ccc = @candidate_current_company_params
      @candidate_current_company.update_attributes(ccc)
    else
      false
    end
  end

  def update_all_candidate_companies
    @candidate_company_params.each do |company|
      saved = update_candidate_company(company)
      if !saved
        return false
      end
    end
  end

  def create_candidate_hability
    @candidate.build_candidate_hability
    candidate_hability = @candidate.candidate_hability
    candidate_hability.save
  end

  def create_candidate_education
    @candidate.build_candidate_education
    candidate_education = @candidate.candidate_education
    candidate_education.save
  end

  def create_or_update_candidate_education_language
    if @candidate_education_language_params.present?
      return_value = true
      CandidateEducationLanguage.transaction do
        @candidate_education_language_params.each do |index, language_params|
          # check if already exists to avoid duplicate
          if language_params[:id].present? && language_params[:language_level_id].present?
            language = CandidateEducationLanguage.update(language_params[:id], language_params)
          # if just id is present, it probably have been deleted
          elsif language_params[:id].present? && language_params[:language_level_id].nil?
            language = CandidateEducationLanguage.destroy(language_params[:id])
          else
            language = CandidateEducationLanguage.new(language_params)
            @candidate_education.candidate_education_languages << language
          end
          if !language.save
            return_value = false
            raise ActiveRecord::Rollback
          end
        end
      end
      return return_value
    else
      false
    end
  end

  def create_candidate_pretension
    @candidate.build_candidate_pretension
    candidate_pretension = @candidate.candidate_pretension
    candidate_pretension.save
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

    def update_candidate_company(params)
      candidate_company = CandidateCompany.find(params[:id])
      return candidate_company.update_attributes(params)
    end

    def destroy_candidate_company(params)
      CandidateCompany.destroy(params[:id])
    end

    def filter_date_params(params)
      if params[:start_date].present? && params[:end_date].present?
        params[:start_date] = Date.parse(params[:start_date])
        params[:end_date]   = Date.parse(params[:end_date])
      end
    end

    def calculate_months(params)
      if params[:start_date].present? && params[:end_date].present?
        return get_months_between(params[:start_date], params[:end_date])
      else
        return 0
      end
    end

    def get_months_between(start_date, end_date)
      # it doesn't count days
      (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)
    end
end