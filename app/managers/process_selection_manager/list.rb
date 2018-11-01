module ProcessSelectionManager
  class List < Base

    def active
      @owner
        .process_selections
        .where(state: [:started, :setting])
        .first
    end

    def completed
      @owner
        .process_selections
        .where(state: [:completed])
    end
  end
end
