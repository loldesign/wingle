module ProcessSelectionManager
  class Info < Base

    def process
      {
        first_level: candidates_by_state(:first_level),
        second_level: candidates_by_state(:second_level),
        third_level: candidates_by_state(:third_level),
        fourth_level: candidates_by_state(:fourth_level),
        received_proposal: candidates_by_state(:received_proposal),
        accepted_proposal: candidates_by_state(:accepted_proposal),
        ignored: candidates_by_state(:ignored),
      }
    end

    private

    def process_selection
      @process_selection ||= @owner
                                .process_selections
                                .where(state: [:started, :setting])
                                .first
    end

    def candidates_by_state(state)
      process_selection()
        .candidate_process_selections
        .where(state: state)
        .count.to_s.rjust(2, '0')
    end
  end
end

# How to use
# ProcessSelectionManager::Info.new(owner: current_company).process
