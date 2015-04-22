module WaffleCal

	class Event

		attr_accessor :uid, :start_time, :end_time, :summary, :description, :location

		def initialize(attrs={})
			attrs.each { |key, val| self.send("#{key}=", val) }
		end

		def to_s
			output = []
			output << start_event
      		output << date_start_str
      		output << date_end_str
      		output << uid_str
			output << summary_str if summary
			output << location_str if location
			output << description_str if description
			output << end_event
			output.join("\r\n")
		end

		protected

		def date_start_str
			"DTSTART:#{start_time}"
		end

		def date_end_str
			"DTEND:#{end_time}"
		end

		def uid_str
			"UID:#{uid}"
		end

		def summary_str
			"SUMMARY:#{summary}"
		end

		def location_str
			"LOCATION:#{location}"
		end

		def description_str
			"DESCRIPTION:#{description}"
		end

		def start_event
			"BEGIN:VEVENT"
		end

		def end_event
			"END:VEVENT"
		end
	end
end