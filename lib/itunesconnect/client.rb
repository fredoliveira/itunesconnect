require 'itunesconnect'
require 'net/https'
require 'uri'

class ITunesConnect::Client
  attr_accessor :username
  attr_accessor :password
  attr_accessor :vendor_number
  attr_accessor :type_of_report
  attr_accessor :date_type
  attr_accessor :report_type
  attr_accessor :report_date

  # Allow the user to specify where the parsed files should go
  attr_accessor :output_dir

  def initialize
    # Default the output dir to 'output'
    @output_dir = "output"
  end

  def perform_request
    uri = URI.parse(ITunesConnect::ITUNES_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(
      'USERNAME' => @username.to_s,
      'PASSWORD' => @password.to_s,
      'VNDNUMBER' => @vendor_number.to_s,
      'TYPEOFREPORT' => @type_of_report.to_s,
      'DATETYPE' => @date_type.to_s,
      'REPORTTYPE' => @report_type.to_s,
      'REPORTDATE' => @report_date.to_s
    )

    # headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    response = http.request(request)

    if response['filename'] != nil
      filename = response['filename']

      # Create the output dir if needed
      unless File.exists?(output_dir)
        Dir.mkdir(output_dir)
      end

      File.open(File.join(output_dir, filename), "wb") do |f|
        f.write(response.body)
      end

      ITunesConnect.logger.info "File Downloaded Successfully (#{filename})"
    elsif response['errormsg'] != nil
      ITunesConnect.logger.error response['errormsg']
    else
      ITunesConnect.logger.error "No recognized response, dumping headers.."
      response.each_header do | key, value |
        ITunesConnect.logger.error "-> #{key}: #{value}"
      end
    end
  end
end
