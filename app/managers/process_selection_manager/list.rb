module ProcessSelectionManager
  class List < Base

    def active
      @owner
        .process_selections
        .where(state: [:started, :setting])
        .first
    end

    def historic
      @owner
        .process_selections
        .where(state: [:historic])
    end
  end
end

# How to use
# ProcessSelectionManager::List.new(owner: current_company).active
