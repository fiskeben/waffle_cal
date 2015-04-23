module WaffleCal

	class Event

		attr_accessor :uid, :start_time, :end_time, :summary, :description, :location

		@@time_format = "%Y%m%dT%H%M00"

		def initialize(attrs={})
			attrs.each { |key, val| self.send("#{key}=", val) }
		end

		def to_s
			valid?

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

		def valid?
			raise Errors::IncompleteEventError.new('Missing uid')  if uid.nil?
			raise Errors::IncompleteEventError.new('Missing start time') if start_time.nil?
			raise Errors::IncompleteEventError.new('Missing end time') if end_time.nil?
			raise Errors::IncompleteEventError.new('Missing summary') if summary.nil?
			raise Errors::IncompleteEventError.new('Start time is not an instance of Time') unless start_time.instance_of?(Time)
			raise Errors::IncompleteEventError.new('End time is not an instance of Time') unless end_time.instance_of?(Time)
			raise Errors::IllegalEventError.new('End time is before start time') if start_time > end_time
		end

		def date_start_str
			"DTSTART:#{start_time.strftime(@@time_format)}"
		end

		def date_end_str
			"DTEND:#{end_time.strftime(@@time_format)}"
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