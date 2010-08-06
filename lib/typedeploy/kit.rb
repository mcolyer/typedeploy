module Typedeploy
  class Kit
    attr_reader :data
    attr_accessor :kid

    def initialize(id, data)
      @kid = id
      @data = data
      @api = Api.new
    end

    def publish
      @api.publish(@kid)
    end

    def create
      @api.create(self)
    end

    class Family
      def initialize(data)
        @data = data
      end

      def fid
        @data['id']
      end

      def to_params
        params = {'variations' => @data['variations'].join(',')}
        params['subset'] = @data['subset']
        params
      end
      def to_s
        "<Family #{@data['id']}:#{to_params.inspect}>"
      end
    end

    def families
      @data['families'].map { |f| Family.new(f) }
    end

    def to_params
      params = {'domains' => @data['domains'].join(",")}

      ['name', 'badge', 'analytics'].each do |attr|
        params[attr] = @data[attr]
      end

      params
    end

    def to_s
      "<Kit #{@data['name']}:#{to_params.inspect}>"
    end
  end
end
