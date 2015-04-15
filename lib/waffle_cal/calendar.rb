module WaffleCal

	class Calendar

		attr_accessor :prod_id, :events

		def initialize(prod_id=nil)
			@prod_id = prod_id
		end

		def <<(event)
			add_event(event)
		end

		def add_event(event)
			@events ||= []
			@events << event
		end

		def events
			@events || []
		end

		def to_s
			output = []

			output += start_calendar
			output += events.collect { |evt| evt.to_s }
			output += end_calendar
			
			output.join("\r\n")
		end

		protected

		def start_calendar
			output = []
			output << "BEGIN:VCALENDAR"
		    output << "METHOD:PUBLISH"
			output << "VERSION:2.0"
			output << @prod_id
			output
		end

		def end_calendar
			["END:VCALENDAR"]
		end
	end
end
